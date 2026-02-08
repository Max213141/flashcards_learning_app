import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class WordDefinitionScreen extends StatefulWidget {
  final Word wordData;
  const WordDefinitionScreen({super.key, required this.wordData});

  @override
  State<WordDefinitionScreen> createState() => _WordDefinitionScreenState();
}

class _WordDefinitionScreenState extends State<WordDefinitionScreen> {
  bool know = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Center(child: Text('Определение', style: AppConst.h2)),
            ),
            SvgPicture.asset('assets/iconss/edit.svg', width: 24),
            SizedBox(width: 15),
            SvgPicture.asset('assets/iconss/delete.svg', width: 24),
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
              '잠깐만',
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
                        Text(
                          'Минутку, подожди немного, секундочку',
                          style: AppConst.text,
                        ),
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
                            Text('Глаголы действия', style: AppConst.h2),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  know = !know;
                                });
                              },
                              child: SvgPicture.asset(
                                'assets/iconss/knowledge_button.svg',
                                width: 65,
                                height: 65,
                                color: know
                                    ? AppConst.primary
                                    : AppConst.background,
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
    );
  }
}
