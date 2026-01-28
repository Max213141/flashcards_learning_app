import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/screens/edit_word_screen/custom_textfield.dart';
import 'package:flutter/material.dart';

class EditWordScreen extends StatefulWidget {
  const EditWordScreen({super.key});

  @override
  State<EditWordScreen> createState() => _EditWordScreenState();
}

class _EditWordScreenState extends State<EditWordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController learningWordController = TextEditingController();
  final TextEditingController translationController = TextEditingController();
  final TextEditingController transcriptionController = TextEditingController();
  final TextEditingController partofSpeechController = TextEditingController();
  final TextEditingController usageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.background,
      appBar: AppBar(
        title: Text('Изменение слова', style: AppConst.h1),
        backgroundColor: AppConst.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
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
                        child: CustomTextfield(
                          controller: transcriptionController,
                        ),
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
                        child: CustomTextfield(
                          controller: partofSpeechController,
                        ),
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
                    height: 55,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppConst.buttonBackground,
                        foregroundColor: AppConst.black,
                        side: BorderSide(color: AppConst.primary, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      onPressed: () {
                        print(learningWordController.text);
                      },
                      child: Text('Сохранить', style: AppConst.text),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
