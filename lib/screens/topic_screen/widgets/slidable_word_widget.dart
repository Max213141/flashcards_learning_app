import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidableWordWidget extends StatelessWidget {
  final int index;
  final Word wordEntity;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const SlidableWordWidget({
    super.key,
    required this.index,
    required this.onDelete,
    required this.onEdit,
    required this.wordEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(wordEntity.id ?? wordEntity.hashCode),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // All actions are defined in the children parameter.
        children: [
          CustomSlidableAction(
            onPressed: (_) => onDelete(),
            backgroundColor: AppConst.primary,
            child: SizedBox(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/iconss/delete.svg',
                    height: 22,
                    width: 22,
                  ),
                  const SizedBox(height: 4),
                  Text('Удалить', style: AppConst.text),
                ],
              ),
            ),
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          CustomSlidableAction(
            flex: 2,
            onPressed: (_) => onEdit(),
            backgroundColor: AppConst.primary,
            child: SizedBox(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/iconss/edit.svg',
                    height: 22,
                    width: 22,
                  ),
                  const SizedBox(height: 4),
                  Text('Редактировать', style: AppConst.text),
                ],
              ),
            ),
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: ClipRect(
        child: Stack(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: (index + 1).isEven
                    ? AppConst.background
                    : const Color(0xffF0F0ED),
              ),
              child: SizedBox(
                height: 60,
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(wordEntity.word, style: AppConst.h2),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      color: Color(0xffDFDFDF),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          wordEntity.translation,
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
            if (wordEntity.learned)
              Positioned.fill(
                child: IgnorePointer(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 15,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppConst.primary.withValues(alpha: 0.1),

                            AppConst.primary.withValues(alpha: 0.9),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
