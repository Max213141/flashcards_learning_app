import 'package:flashcards_learning_app/common_widgets/custom_action_button.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/screens/edit_word_screen/custom_textfield.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/color_selector_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopUp extends StatefulWidget {
  const PopUp({super.key});

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  final TextEditingController topicName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Color(0xffF7F9E6),
            boxShadow: List.generate(
              1,
              (_) => BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text('Новая тема', style: AppConst.h1)),
                SizedBox(height: 40),
                Text('Название', style: AppConst.text),
                CustomTextfield(controller: topicName),
                SizedBox(height: 40),
                Text('Цвет темы', style: AppConst.text),
                ColorSelector(),

                SizedBox(height: 40),
                TextButton(
                  onPressed: () {},
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
                    child: CustomActionButton(
                      buttonText: 'Создать тему',
                      onTap: () {},
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
