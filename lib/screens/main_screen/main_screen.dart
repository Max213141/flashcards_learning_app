import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool buttonsHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: AppConst.background,
      floatingActionButton: RotatingFab(
        onPressed: () {
          setState(() {
            buttonsHidden = !buttonsHidden;
          });
        },
      ),
      body: Stack(
        children: [
          Align(
            alignment: AlignmentGeometry.topCenter,
            child: TopicsListWidget(),
          ),
          Positioned(
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom + 85,
            child: Offstage(
              offstage: buttonsHidden,
              child: Column(
                children: [
                  CustomActionButton(
                    buttonText: 'Новая тема',
                    width: 200,
                    onTap: () {},
                  ),
                  CustomActionButton(
                    buttonText: 'Импорт',
                    width: 200,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
