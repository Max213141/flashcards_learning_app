import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/topic.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class PopUpBodyWidget extends StatefulWidget {
  const PopUpBodyWidget({super.key});

  @override
  State<PopUpBodyWidget> createState() => _PopUpBodyWidgetState();
}

class _PopUpBodyWidgetState extends State<PopUpBodyWidget> {
  final TextEditingController _topicController = TextEditingController();

  int _selectedColorValue = AppConst.yellow.toARGB32();
  Color _selectedColor = AppConst.yellow;
  List<Word> _importedWords = [];
  List<String> _topicSuggestions = [];
  bool _loading = false;

  @override
  void dispose() {
    _topicController.dispose();
    super.dispose();
  }

  Future<void> _pickJson() async {
    setState(() => _loading = true);
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: const ['json'],
        withData: true,
      );
      if (result == null || result.files.isEmpty) return;

      final picked = result.files.single;
      String contents;
      if (picked.bytes != null) {
        contents = utf8.decode(picked.bytes!);
      } else if (picked.path != null) {
        contents = await File(picked.path!).readAsString();
      } else {
        throw const FormatException('No file data available');
      }

      final decoded = jsonDecode(contents);
      if (decoded is! List) {
        throw const FormatException('JSON must be a list of words');
      }
      final words = decoded
          .cast<Map<String, dynamic>>()
          .map((e) => Word.fromJson(e))
          .toList();

      final List<String> topicNames =
          words
              .map((w) => (w.topic ?? '').trim())
              .where((t) => t.isNotEmpty)
              .toSet()
              .toList()
            ..sort();

      setState(() {
        _importedWords = words;
        _topicSuggestions = topicNames;
        if (_topicController.text.trim().isEmpty &&
            _topicSuggestions.isNotEmpty) {
          _topicController.text = _topicSuggestions.first;
        }
      });
    } on PlatformException catch (e) {
      _showSnack('File access error: ${e.message}');
    } on FormatException catch (e) {
      _showSnack(e.message);
    } catch (e) {
      _showSnack('Failed to read JSON');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _createTopic() async {
    final name = _topicController.text.trim();
    if (name.isEmpty) return;

    setState(() => _loading = true);
    try {
      final topic = Topic(topicName: name, colorValue: _selectedColorValue);
      final words = _importedWords.map((w) => w.copyWith(topic: name)).toList();
      await appDatabase.createTopicWithWords(topic: topic, words: words);
      if (!mounted) return;
      Navigator.of(context).pop(true);
    } catch (e) {
      _showSnack('Failed to create topic');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text('Новая тема', style: AppConst.h1)),
        SizedBox(height: 40),
        Text('Название', style: AppConst.text),
        Row(
          children: [
            Expanded(child: CustomTextfield(controller: _topicController)),
          ],
        ),
        if (_topicSuggestions.isNotEmpty) ...[
          const SizedBox(height: 8),

          TopicsExpansionTile(
            onTap: (String topicSuggestion) {
              setState(() => _topicController.text = topicSuggestion);
            },
            topicSuggestions: _topicSuggestions,
          ),
        ],
        SizedBox(height: 40),
        Text('Цвет темы', style: AppConst.text),
        ColorSelector(
          selectedColor: _selectedColor,
          onColorChange: (colorValue, color) {
            setState(() {
              _selectedColorValue = colorValue;
              _selectedColor = color;
            });
          },
        ),

        SizedBox(height: 40),
        TextButton(
          onPressed: _loading ? null : _pickJson,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/iconss/file_export.svg',
                height: 24,
                color: AppConst.black,
              ),
              SizedBox(width: 5),
              Text('Загрузить файл JSON', style: AppConst.text),
            ],
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 350,
            height: 55,
            child: ValueListenableBuilder<TextEditingValue>(
              valueListenable: _topicController,
              builder: (_, value, _) {
                bool canCreate =
                    _topicController.text.trim().isNotEmpty && !_loading;

                return FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppConst.buttonBackground,
                    foregroundColor: AppConst.black,
                    disabledBackgroundColor: Color(0x40D7D7D7),
                    side: canCreate
                        ? BorderSide(color: AppConst.primary, width: 2)
                        : BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),

                  onPressed: canCreate ? _createTopic : null,
                  child: Text('Создать тему', style: AppConst.text),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
