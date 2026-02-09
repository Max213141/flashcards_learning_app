import 'package:flutter/material.dart';

class WordDescriptionWidget extends StatefulWidget {
  const WordDescriptionWidget({super.key});

  @override
  State<WordDescriptionWidget> createState() => _WordDescriptionWidgetState();
}

class _WordDescriptionWidgetState extends State<WordDescriptionWidget> {
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
            title: Text('Слово в употреблении'),
            leading: Icon(
              Icons.lightbulb_outlined,
              fontWeight: FontWeight.w400,
            ),
            shape: Border.all(color: Colors.transparent),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 58, right: 15, bottom: 15),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'используется, чтобы попросить кого-то подождать короткий миг, или как вежливое «Извините»/«Прошу прощения», чтобы привлечь внимание или пройти.',
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
