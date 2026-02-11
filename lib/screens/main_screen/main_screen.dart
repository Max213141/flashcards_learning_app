import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
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
  late final Stream<List<TopicSummary>> _topicsStream;

  @override
  void initState() {
    super.initState();
    _topicsStream = appDatabase.watchTopicSummaries();
  }

  Future<void> _exportBackup() async {
    try {
      final words = await appDatabase.getAllWordsWithTopicName();
      final jsonList = words.map((w) => w.toJson()).toList();
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
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Резервная копия сохранена')),
      );
    } on PlatformException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка доступа к файлам: ${e.message}')),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось создать резервную копию')),
      );
    }
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
          AppBarWidget(
            firstPart: Row(
              children: [
                CircularProgressBar(
                  width: 50,
                  height: 50,
                  indicatorColor: AppConst.lavender,
                  accomplishment: Text('50%', style: AppConst.additionalText),
                ),
                SizedBox(width: 10),
                FittedBox(
                  child: Text('Общий \nпрогресс', style: AppConst.text),
                ),
              ],
            ),

            secondPart: Row(
              children: [
                CircularProgressBar(
                  width: 50,
                  height: 50,
                  indicatorColor: AppConst.primary,
                  accomplishment: FancyAccomplishmentText(),
                ),
                SizedBox(width: 10),
                FittedBox(child: Text('Дневная \nцель', style: AppConst.text)),
              ],
            ),
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
                          icon: 'assets/iconss/archive.svg',
                          onTap: () {},
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
