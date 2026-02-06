import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/common_widgets/app_bar.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/pop_up.dart';
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
      body: Column(
        children: [
          AppBarWidget(
            firstPart: Row(
              children: [
                CircularProgressBar(
                  width: 50,
                  height: 50,
                  indicatorColor: AppConst.lavender,
                  accomplishment: Text('50%', style: AppConst.additionalText),
                ),
                SizedBox(width: 10),
                Text('Общий \nпрогресс', style: AppConst.text),
              ],
            ),

            secondPart: Row(
              children: [
                CircularProgressBar(
                  width: 50,
                  height: 50,
                  indicatorColor: AppConst.primary,
                  accomplishment: Text('5/10', style: AppConst.additionalText),
                ),
                SizedBox(width: 10),
                Text('Дневная \nцель', style: AppConst.text),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentGeometry.topCenter,
                  child: TopicsListWidget(),
                ),
                Positioned(
                  right: 30,
                  bottom: MediaQuery.of(context).padding.bottom + 85,
                  child: Offstage(
                    offstage: buttonsHidden,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomActionButton(
                            buttonText: 'Создание резервной копии',

                            icon: 'assets/iconss/archive.svg',
                            onTap: () {},
                          ),
                        ),
                        CustomActionButton(
                          buttonText: 'Новая тема',
                          icon: 'assets/iconss/plus.svg',

                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => PopUp(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
