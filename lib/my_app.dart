import 'package:flashcards_learning_app/screens/edit_word_screen/edit_word_screen.dart';
import 'package:flashcards_learning_app/screens/screens.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: EditWordScreen(),
    );
  }
}
