import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWordWidget extends StatefulWidget {
  final int index;
  final String word;
  final String translation;
  const SlidableWordWidget({
    super.key,
    required this.index,
    required this.word,
    required this.translation,
  });

  @override
  State<SlidableWordWidget> createState() => _SlidableWordWidgetState();
}

class _SlidableWordWidgetState extends State<SlidableWordWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: ValueKey(widget.index),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: const [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: null,
            backgroundColor: AppConst.primary,
            foregroundColor: AppConst.black,
            icon: Icons.delete, //TODO use icon from assets
            label: 'Удалить',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: null,
            backgroundColor: AppConst.primary,
            foregroundColor: AppConst.black,
            icon: Icons.archive, //TODO use icon from assets
            label: 'Редактировать',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: (widget.index + 1).isEven
              ? AppConst.background
              : Color(0xffF0F0ED),
        ),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              Expanded(
                child: Center(child: Text(widget.word, style: AppConst.h2)),
              ),
              VerticalDivider(thickness: 1, color: Color(0xffDFDFDF)),
              Expanded(
                child: Center(
                  child: Text(
                    widget.translation,
                    style: AppConst.h2,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
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
