import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/picker_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool buttonsHidden = true;
  late Stream<List<TopicSummary>> _topicsStream;
  TopicSortOption _selectedSort = TopicSortOption.createdDesc;
  late final UserGoals? currentGoals;

  @override
  void initState() {
    super.initState();
    _topicsStream = _buildTopicsStream();
  }

  Stream<List<TopicSummary>> _buildTopicsStream() {
    return appDatabase.watchTopicSummaries(sortOption: _selectedSort);
  }

  void _onSortChanged(TopicSortOption option) {
    if (_selectedSort == option) return;
    setState(() {
      _selectedSort = option;
      _topicsStream = _buildTopicsStream();
    });
  }

  Future<void> _exportBackup() async {
    try {
      final words = await appDatabase.getAllWordsWithTopicName();
      final jsonList = words.map(_wordToBackupJson).toList();
      final jsonString = const JsonEncoder.withIndent('  ').convert(jsonList);

      final fileName =
          'flashcards_backup_${DateTime.now().toIso8601String().replaceAll(':', '-')}.json';
      final path = await FilePicker.platform.saveFile(
        dialogTitle: 'Сохранить резервную копию',
        fileName: fileName,
        type: FileType.custom,
        bytes: utf8.encode(jsonString),
        allowedExtensions: const ['json'],
      );
      if (path == null) return;
      final filePath = path.endsWith('.json') ? path : '$path.json';
      await File(filePath).writeAsString(jsonString);
      _showSnack('Резервная копия сохранена');
    } on PlatformException catch (e) {
      _showSnack('Ошибка доступа к файлам: ${e.message}');
    } catch (_) {
      _showSnack('Не удалось создать резервную копию');
    }
  }

  Future<void> _onRestoreBackupTap() async {
    final shouldRestore = await showDialog<bool>(
      context: context,
      builder: (context) =>
          const PopUpBox(popupContent: RestoreBackupAcceptanceBody()),
    );
    if (shouldRestore != true) return;
    await _restoreBackup();
  }

  Future<void> _restoreBackup() async {
    try {
      final pickedData = await PickerUtil().pickJson();
      if (pickedData is! List) {
        throw const FormatException('JSON must be a list of words');
      }
      final backupJson = pickedData
          .map<Map<String, dynamic>>((item) {
            if (item is! Map) {
              throw const FormatException(
                'Each JSON item must be an object with word data',
              );
            }
            return item.map(
              (key, value) => MapEntry(key.toString(), value),
            );
          })
          .toList();

      final restoredWordsCount = await appDatabase.restoreFromBackupJson(
        backupJson,
      );
      if (!mounted) return;
      setState(() {
        _topicsStream = _buildTopicsStream();
      });
      _showSnack('Восстановлено слов: $restoredWordsCount');
    } on PlatformException catch (e) {
      _showSnack('Ошибка доступа к файлам: ${e.message}');
    } on FormatException catch (e) {
      _showSnack(e.message);
    } catch (_) {
      _showSnack('Не удалось восстановить резервную копию');
    }
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Map<String, dynamic> _wordToBackupJson(Word word) {
    final json = <String, dynamic>{
      'word': word.word.trim(),
      'translation': word.translation.trim(),
      'learned': word.learned,
    };

    void addIfNotEmpty(String key, String? value) {
      final trimmed = value?.trim();
      if (trimmed == null || trimmed.isEmpty) return;
      json[key] = trimmed;
    }

    addIfNotEmpty('topic', word.topic);
    addIfNotEmpty('transcription', word.transcription);
    addIfNotEmpty('partOfSpeech', word.partOfSpeech);
    addIfNotEmpty('usage', word.usage);

    return json;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: AppConst.background,
      floatingActionButton: RotatingFab(
        onPressed: () {
          setState(() {
            buttonsHidden = !buttonsHidden;
          });
        },
      ),
      body: Column(
        children: [
          AppBarCustomizedWidget(),

          FilterButtonWidget(
            selectedSort: _selectedSort,
            onSortChanged: _onSortChanged,
          ),

          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentGeometry.topCenter,
                  child: TopicsListWidget(topicsStream: _topicsStream),
                ),
                Positioned(
                  right: 30,
                  bottom: MediaQuery.of(context).padding.bottom + 85,
                  child: Offstage(
                    offstage: buttonsHidden,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomActionButton(
                          buttonText: 'Восстановление из копии',
                          icon: 'assets/iconss/unarchive.svg',
                          onTap: _onRestoreBackupTap,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomActionButton(
                            buttonText: 'Создание резервной копии',
                            icon: 'assets/iconss/archive.svg',
                            onTap: _exportBackup,
                          ),
                        ),
                        CustomActionButton(
                          buttonText: 'Новая тема',
                          icon: 'assets/iconss/plus.svg',

                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  PopUpBox(popupContent: PopUpBodyWidget()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
