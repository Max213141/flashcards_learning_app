import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EditWordScreen extends StatefulWidget {
  final Word? word;

  const EditWordScreen({super.key, this.word});

  @override
  State<EditWordScreen> createState() => _EditWordScreenState();
}

class _EditWordScreenState extends State<EditWordScreen> {
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
        child: Center(child: EditWordForm(word: widget.word)),
      ),
    );
  }
}
