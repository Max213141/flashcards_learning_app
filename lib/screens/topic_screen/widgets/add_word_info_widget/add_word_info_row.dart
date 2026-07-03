import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class AddWordInfoRow extends StatelessWidget {
  const AddWordInfoRow({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline, size: 20),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: AppConst.text)),
        ],
      ),
    );
  }
}
