import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WordDescriptionWidget extends StatefulWidget {
  final String? usage;
  const WordDescriptionWidget({super.key, this.usage});

  @override
  State<WordDescriptionWidget> createState() => _WordDescriptionWidgetState();
}

class _WordDescriptionWidgetState extends State<WordDescriptionWidget> {
  bool _expanded = false;

  // @override
  // void didUpdateWidget(covariant WordDescriptionWidget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (oldWidget.usage != widget.usage) {
  //     _expanded = false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.only(
        top: 32.0,
        left: 26,
        right: 26,
        bottom: bottomPadding,
      ),
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
            trailing: CustomFlipingIcon(isExpanded: _expanded),
            shape: Border.all(color: Colors.transparent),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 58, right: 15, bottom: 15),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    widget.usage ?? 'Информация не заполнена',
                    style: widget.usage == null
                        ? AppConst.additionalText.copyWith(fontSize: 12)
                        : AppConst.text,
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
