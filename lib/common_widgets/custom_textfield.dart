import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLength;
  final bool digitsOnly;
  final ValueChanged<String>? onChanged;
  final int? minLines;
  final int? maxLines;
  final bool expands;
  const CustomTextfield({
    super.key,
    required this.controller,
    this.maxLength,
    this.digitsOnly = false,
    this.onChanged,
    this.minLines,
    this.maxLines,
    this.expands = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: expands,
      controller: controller,
      minLines: expands ? null : minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      style: AppConst.text,
      maxLength: maxLength,
      keyboardType: digitsOnly
          ? TextInputType.number
          : ((maxLines == null || (maxLines ?? 1) > 1 || (minLines ?? 1) > 1)
                ? TextInputType.multiline
                : TextInputType.text),
      inputFormatters: digitsOnly
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      decoration: InputDecoration(
        counter: SizedBox.shrink(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD7D7D7)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppConst.black.withValues(alpha: .3)),
        ),
        // errorBorder: UnderlineInputBorder(
        // borderSide: BorderSide(color: Color(0xffD7D7D7))
        // ),
      ),
    );
  }
}
