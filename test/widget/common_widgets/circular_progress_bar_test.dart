import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildProgressBar({required double progress}) {
    return MaterialApp(
      home: Scaffold(
        body: CircularProgressBar(
          width: 40,
          height: 40,
          indicatorColor: Colors.blue,
          progress: progress,
          accomplishment: const Text('0%'),
        ),
      ),
    );
  }

  testWidgets('renders zero progress without CircularProgressIndicator', (
    tester,
  ) async {
    await tester.pumpWidget(buildProgressBar(progress: 0));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('0%'), findsOneWidget);
  });

  testWidgets('renders non-zero progress with CircularProgressIndicator', (
    tester,
  ) async {
    await tester.pumpWidget(buildProgressBar(progress: .5));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('0%'), findsOneWidget);
  });
}
