import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  final void Function(int, Color) onColorChange;
  final Color selectedColor;
  const ColorSelector({
    super.key,
    required this.onColorChange,
    required this.selectedColor,
  });

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
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
        final isSelected = color == widget.selectedColor;

        return Expanded(
          child: GestureDetector(
            onTap: () => widget.onColorChange(color.toARGB32(), color),
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
          ),
        );
      }).toList(),
    );
  }
}
