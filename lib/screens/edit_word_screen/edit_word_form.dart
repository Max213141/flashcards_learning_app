import 'package:flashcards_learning_app/common_widgets/custom_action_button.dart';
import 'package:flashcards_learning_app/common_widgets/custom_textfield.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/material.dart';

class EditWordForm extends StatefulWidget {
  final Word? word;
  final VoidCallback? onSave;
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Align(
              alignment: AlignmentGeometry.topLeft,
              child: Text('Изучаемое слово', style: AppConst.h2),
            ),
          ),
          SizedBox(
            width: 310,
            height: 40,
            child: CustomTextfield(controller: learningWordController),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20),
            child: Align(
              alignment: AlignmentGeometry.topLeft,
              child: Text('Перевод', style: AppConst.h2),
            ),
          ),
          SizedBox(
            width: 310,
            height: 40,
            child: CustomTextfield(controller: translationController),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: ExpansionTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Дополнительно', style: AppConst.h2),
              ),
              shape: Border.all(color: Colors.transparent),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text('Транскрипция', style: AppConst.h2),
                  ),
                ),
                SizedBox(
                  width: 310,
                  height: 40,
                  child: CustomTextfield(controller: transcriptionController),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text('Часть речи', style: AppConst.h2),
                  ),
                ),
                SizedBox(
                  width: 310,
                  height: 40,
                  child: CustomTextfield(controller: partofSpeechController),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text('Употребление', style: AppConst.h2),
                  ),
                ),
                SizedBox(
                  width: 310,
                  height: 40,
                  child: CustomTextfield(controller: usageController),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: SizedBox(
              width: 300,
              child: CustomActionButton(
                buttonText: 'Сохранить',
                onTap: widget.onSave ?? () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditWordDialog extends StatelessWidget {
  final Word word;
  final VoidCallback? onSave;
  const EditWordDialog({super.key, required this.word, this.onSave});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.75;
    return Dialog(
      backgroundColor: AppConst.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: SizedBox(
          height: height,
          child: Column(
            children: [
              Text('Изменение слова', style: AppConst.h1),
              const SizedBox(height: 8),
              Expanded(
                child: EditWordForm(
                  word: word,
                  onSave: onSave,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
