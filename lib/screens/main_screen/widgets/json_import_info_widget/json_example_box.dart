import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class JsonExampleBox extends StatelessWidget {
  const JsonExampleBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppConst.white,
        border: Border.all(color: AppConst.primary, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const SelectableText(
        '[\n'
        '  {\n'
        '    "word": "hello",\n'
        '    "translation": "hola",\n'
        '    "topic": "Basic greetings",\n'
        '    "transcription": "/heh-loh/",\n'
        '    "partOfSpeech": "interjection",\n'
        '    "usage": "Hello, nice to meet you."\n'
        '  }\n'
        ']',
        style: TextStyle(fontFamily: 'monospace', fontSize: 12, height: 1.35),
      ),
    );
  }
}
