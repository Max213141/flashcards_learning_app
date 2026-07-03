import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/add_word_info_widget/add_word_info_widget.dart';
import 'package:flutter/material.dart';

class AddWordDialog extends StatelessWidget {
  final Future<void> Function(Word updatedWord)? onSave;
  const AddWordDialog({super.key, this.onSave});

  @override
  Widget build(BuildContext context) {
    return _AddWordDialogContent(onSave: onSave);
  }
}

class _AddWordDialogContent extends StatefulWidget {
  const _AddWordDialogContent({this.onSave});

  final Future<void> Function(Word updatedWord)? onSave;

  @override
  State<_AddWordDialogContent> createState() => _AddWordDialogContentState();
}

class _AddWordDialogContentState extends State<_AddWordDialogContent> {
  bool _showInfo = false;

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    // final media = MediaQuery.of(context);
    // final maxHeight = (media.size.height - media.viewInsets.bottom - 48).clamp(
    //   280.0,
    //   media.size.height * 0.95,
    // );

    return PopUpBox(
      popupContent: _showInfo
          ? AddWordInfoWidget(
              onBack: () {
                setState(() {
                  _showInfo = false;
                });
              },
            )
          : InfoButtonStack(
              tooltip: l10n.topicAddWordInfoTooltip,
              onTap: () {
                setState(() {
                  _showInfo = true;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(l10n.topicAddWordDialogTitle, style: AppConst.h1),
                  const SizedBox(height: 8),
                  Flexible(child: EditWordForm(onSave: widget.onSave)),
                ],
              ),
            ),
    );
  }
}
