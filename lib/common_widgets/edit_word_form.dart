import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/material.dart';

class EditWordForm extends StatefulWidget {
  final Word? word;
  final Future<void> Function(Word updatedWord)? onSave;
  const EditWordForm({super.key, this.word, this.onSave});

  @override
  State<EditWordForm> createState() => _EditWordFormState();
}

class _EditWordFormState extends State<EditWordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController learningWordController = TextEditingController();
  final TextEditingController translationController = TextEditingController();
  final TextEditingController transcriptionController = TextEditingController();
  final TextEditingController partofSpeechController = TextEditingController();
  final TextEditingController usageController = TextEditingController();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final word = widget.word;
    if (word != null) {
      learningWordController.text = word.word;
      translationController.text = word.translation;
    }
  }

  @override
  void dispose() {
    learningWordController.dispose();
    translationController.dispose();
    transcriptionController.dispose();
    partofSpeechController.dispose();
    usageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: Text('Изучаемое слово', style: AppConst.h2),
            ),
            TextfieldPaddingWrapper(
              textField: CustomTextfield(controller: learningWordController),
            ),
            SizedBox(height: 20),
            Text('Перевод', style: AppConst.h2),
            TextfieldPaddingWrapper(
              textField: CustomTextfield(controller: translationController),
            ),
            SizedBox(height: 15),

            Theme(
              data: Theme.of(context).copyWith(
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent,
              ),
              child: ExpansionTile(
                title: Text(
                  'Дополнительно',
                  style: AppConst.h2,
                  textAlign: TextAlign.left,
                ),
                shape: Border.all(color: Colors.transparent),
                tilePadding: EdgeInsets.all(0),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  Text('Транскрипция', style: AppConst.h2),
                  TextfieldPaddingWrapper(
                    textField: CustomTextfield(
                      controller: transcriptionController,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Часть речи', style: AppConst.h2),
                  TextfieldPaddingWrapper(
                    textField: CustomTextfield(
                      controller: partofSpeechController,
                    ),
                  ),
                  SizedBox(height: 20),

                  Text('Употребление', style: AppConst.h2),
                  TextfieldPaddingWrapper(
                    textField: CustomTextfield(controller: usageController),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Spacer(),
            SizedBox(
              width: 300,
              child: CustomActionButton(
                buttonText: _saving ? 'Сохранение...' : 'Сохранить',
                onTap: () async {
                  final wordValue = learningWordController.text.trim();
                  final translationValue = translationController.text.trim();
                  if (wordValue.isEmpty || translationValue.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Заполните слово и перевод'),
                      ),
                    );
                    return;
                  }
                  if (widget.onSave == null) return;
                  final baseWord =
                      widget.word ??
                      Word(
                        word: wordValue,
                        translation: translationValue,
                      );
                  final updatedWord = baseWord.copyWith(
                    word: wordValue,
                    translation: translationValue,
                  );
                  setState(() => _saving = true);
                  try {
                    await widget.onSave!(updatedWord);
                  } finally {
                    if (mounted) {
                      setState(() => _saving = false);
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
