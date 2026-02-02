import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/router/app_router.dart' as appRouter;
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const double cardHeight = 175;
  static const double overlap = 70;
  static const int itemCount = 10;

  bool buttonsHidden = true;
  @override
  Widget build(BuildContext context) {
    final totalHeight = cardHeight + (itemCount - 1) * (cardHeight - overlap);

    return Scaffold(
      backgroundColor: Colors.blue,
      floatingActionButton: RotatingFab(
        onPressed: () {
          setState(() {
            buttonsHidden = !buttonsHidden;
          });
        },
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * .7,
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: totalHeight,
                          child: Stack(
                            children: List.generate(itemCount, (index) {
                              return Positioned(
                                top: index * (cardHeight - overlap),
                                left: 0,
                                right: 0,
                                child: CustomPaint(
                                  painter: MyPainter(),
                                  child: const SizedBox(
                                    height: cardHeight,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsetsGeometry.symmetric(
                                          horizontal: 25,
                                          vertical: 20,
                                        ),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('140 слов'),
                                                Text('Глаголы действия'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(const appRouter.TestRoute());
                },
                child: Text('To Test Screen'),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom + 85,
            child: Offstage(
              offstage: buttonsHidden,
              child: Column(
                children: [
                  CustomActionButton(buttonText: 'Новая тема', width: 200),
                  CustomActionButton(buttonText: 'Импорт', width: 200),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
