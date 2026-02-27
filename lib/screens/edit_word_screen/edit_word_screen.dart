import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
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
  Future<void> _saveWord(Word updatedWord) async {
    final updated = await appDatabase.updateWord(updatedWord);
    if (!mounted) return;
    if (updated) {
      Navigator.of(context).pop(true);
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Не удалось сохранить изменения')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.background,
      appBar: AppBar(
        title: Text('Изменение слова', style: AppConst.h1),
        backgroundColor: AppConst.background,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: EditWordForm(
          word: widget.word,
          onSave: _saveWord,
          pinSaveButtonToBottom: true,
        ),
      ),
    );
  }
}
