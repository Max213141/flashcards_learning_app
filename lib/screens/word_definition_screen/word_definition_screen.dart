import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class WordDefinitionScreen extends StatefulWidget {
  final Word wordData;
  final String topicName;
  const WordDefinitionScreen({
    super.key,
    required this.wordData,
    required this.topicName,
  });

  @override
  State<WordDefinitionScreen> createState() => _WordDefinitionScreenState();
}

class _WordDefinitionScreenState extends State<WordDefinitionScreen> {
  late Word _wordData;
  late bool know;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _wordData = widget.wordData;
    know = _wordData.learned;
  }

  Future<void> _deleteWord() async {
    final id = _wordData.id;
    if (id == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Невозможно удалить слово')));
      return;
    }
    try {
      await appDatabase.deleteWordById(id);
      if (!mounted) return;
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Не удалось удалить слово')));
    }
  }

  Future<void> _editWord() async {
    final result = await context.router.push<bool>(
      EditWordRoute(word: _wordData),
    );
    if (result != true) return;
    final id = _wordData.id;
    if (id == null) return;
    final freshWord = await appDatabase.getWordById(id);
    if (!mounted || freshWord == null) return;
    setState(() {
      _wordData = freshWord;
      know = _wordData.learned;
      _hasChanges = true;
    });
  }

  Future<void> _toggleLearned() async {
    final id = _wordData.id;
    if (id == null) return;
    final nextValue = !know;
    final updatedWord = _wordData.copyWith(learned: nextValue);
    final updated = await appDatabase.updateWord(updatedWord);
    if (!mounted) return;
    if (!updated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось обновить статус слова')),
      );
      return;
    }
    setState(() {
      know = nextValue;
      _wordData = updatedWord;
      _hasChanges = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.of(context).pop(_hasChanges);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: Center(child: Text('Определение', style: AppConst.h2)),
              ),
              GestureDetector(
                onTap: _editWord,
                child: SvgPicture.asset('assets/iconss/edit.svg', width: 24),
              ),
              SizedBox(width: 15),
              GestureDetector(
                onTap: _deleteWord,
                child: SvgPicture.asset('assets/iconss/delete.svg', width: 24),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _wordData.word,
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              Text('jam-kkan-man', style: AppConst.text),
              SizedBox(height: 15),
              ConstrainedBox(
                constraints: BoxConstraints.expand(width: 355, height: 475),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppConst.white,
                    border: Border.all(width: 12, color: AppConst.primary),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('동사', style: AppConst.text),
                          SizedBox(height: 15),
                          Text('Перевод', style: AppConst.h2),
                          Text(_wordData.translation, style: AppConst.text),
                          SizedBox(height: 15),
                          Text('Слово в употреблении', style: AppConst.h2),
                          Text(
                            'используется, чтобы попросить кого-то подождать короткий миг, или как вежливое «Извините»/«Прошу прощения», чтобы привлечь внимание или пройти.',
                            style: AppConst.text,
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(widget.topicName, style: AppConst.h2),
                              GestureDetector(
                                onTap: _toggleLearned,
                                child: SvgPicture.asset(
                                  'assets/iconss/knowledge_button.svg',
                                  width: 65,
                                  height: 65,
                                  colorFilter: ColorFilter.mode(
                                    know
                                        ? AppConst.primary
                                        : AppConst.background,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
