import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  Color selectedColor = Colors.yellow;

  final colors = [
    AppConst.yellow,
    AppConst.pink,
    AppConst.lavender,
    AppConst.blue,
    AppConst.primary,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: colors.map((color) {
        final isSelected = color == selectedColor;

        return GestureDetector(
          onTap: () {
            setState(() => selectedColor = color);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: Color(0xffD7D7D7), width: 1)
                  : null,
            ),
            child: CircleAvatar(radius: 12, backgroundColor: color),
          ),
        );
      }).toList(),
    );
  }
}
