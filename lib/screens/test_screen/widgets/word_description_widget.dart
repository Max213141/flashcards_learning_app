import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WordDescriptionWidget extends StatefulWidget {
  const WordDescriptionWidget({super.key});

  @override
  State<WordDescriptionWidget> createState() => _WordDescriptionWidgetState();
}

class _WordDescriptionWidgetState extends State<WordDescriptionWidget> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 234, 255, 60),
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Color.fromRGBO(168, 157, 239, 100)),
        ),

        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: Text(
              'Слово в употреблении',
              style: AppConst.text.copyWith(fontWeight: FontWeight.w500),
            ),
            leading: SvgPicture.asset(
              'assets/iconss/lightbulb.svg',
              width: 26,
              colorFilter: const ColorFilter.mode(
                AppConst.black,
                BlendMode.srcIn,
              ),
            ),
            onExpansionChanged: (value) => setState(() => _expanded = value),
            trailing: AnimatedRotation(
              turns: _expanded ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: SvgPicture.asset(
                'assets/iconss/unfold.svg',
                height: 28,
                colorFilter: ColorFilter.mode(AppConst.black, BlendMode.srcIn),
              ),
            ),
            shape: Border.all(color: Colors.transparent),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 58, right: 15, bottom: 15),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'используется, чтобы попросить кого-то подождать короткий миг, или как вежливое «Извините»/«Прошу прощения», чтобы привлечь внимание или пройти.',
                    style: AppConst.text,
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
