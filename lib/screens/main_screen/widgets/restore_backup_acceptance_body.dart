import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/restore_backup_info_widget/restore_backup_info_widget.dart';
import 'package:flutter/material.dart';

class RestoreBackupAcceptanceBody extends StatefulWidget {
  const RestoreBackupAcceptanceBody({super.key});

  @override
  State<RestoreBackupAcceptanceBody> createState() =>
      _RestoreBackupAcceptanceBodyState();
}

class _RestoreBackupAcceptanceBodyState
    extends State<RestoreBackupAcceptanceBody> {
  bool _showRestoreBackupInfo = false;

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    if (_showRestoreBackupInfo) {
      return RestoreBackupInfoWidget(
        onBack: () {
          setState(() {
            _showRestoreBackupInfo = false;
          });
        },
      );
    }

    return InfoButtonStack(
      tooltip: l10n.restoreBackupInfoTooltip,
      onTap: () {
        setState(() {
          _showRestoreBackupInfo = true;
        });
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
            child: Text(
              l10n.restoreBackupTitle,
              textAlign: TextAlign.center,
              style: AppConst.h1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              l10n.restoreBackupMessage,
              textAlign: TextAlign.center,
              style: AppConst.text,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomActionButton(
                  buttonText: l10n.restoreBackupCancelButton,
                  onTap: () => Navigator.of(context).pop(false),
                  borderColor: AppConst.black,
                  borderWidth: .5,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomActionButton(
                  buttonText: l10n.restoreBackupRestoreButton,
                  onTap: () => Navigator.of(context).pop(true),
                  color: Color(0x99FF0A0A),
                  borderColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
