import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class EditFormFields extends StatefulWidget {
  final TextEditingController learningWordController;
  final TextEditingController translationController;
  final TextEditingController transcriptionController;
  final TextEditingController partofSpeechController;
  final TextEditingController usageController;
  const EditFormFields({
    super.key,
    required this.learningWordController,
    required this.translationController,
    required this.transcriptionController,
    required this.partofSpeechController,
    required this.usageController,
  });

  @override
  State<EditFormFields> createState() => _EditFormFieldsState();
}

class _EditFormFieldsState extends State<EditFormFields> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text('Изучаемое слово', style: AppConst.h2),
        ),
        TextfieldPaddingWrapper(
          textField: CustomTextfield(controller: widget.learningWordController),
        ),
        const SizedBox(height: 20),
        Text('Перевод', style: AppConst.h2),
        TextfieldPaddingWrapper(
          textField: CustomTextfield(controller: widget.translationController),
        ),
        const SizedBox(height: 15),
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
            onExpansionChanged: (value) => setState(() => _expanded = value),
            trailing: CustomFlipingIcon(isExpanded: _expanded),
            shape: Border.all(color: Colors.transparent),
            tilePadding: EdgeInsets.zero,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Транскрипция', style: AppConst.h2),
              TextfieldPaddingWrapper(
                height: null,
                textField: CustomTextfield(
                  minLines: 1,
                  maxLines: null,
                  maxLength: 50,
                  controller: widget.transcriptionController,
                ),
              ),
              const SizedBox(height: 20),
              Text('Часть речи', style: AppConst.h2),
              TextfieldPaddingWrapper(
                textField: CustomTextfield(
                  maxLength: 20,
                  controller: widget.partofSpeechController,
                ),
              ),
              const SizedBox(height: 20),
              Text('Употребление', style: AppConst.h2),
              TextfieldPaddingWrapper(
                height: null,
                textField: CustomTextfield(
                  controller: widget.usageController,
                  minLines: 1,
                  maxLines: null,
                  maxLength: 100,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
