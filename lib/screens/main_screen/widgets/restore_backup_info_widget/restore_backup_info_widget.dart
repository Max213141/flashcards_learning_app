import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/restore_backup_info_widget/widgets.dart';
import 'package:flutter/material.dart';

/// Explains how backup restoration replaces local learning data.
class RestoreBackupInfoWidget extends StatelessWidget {
  const RestoreBackupInfoWidget({super.key, required this.onBack});

  /// Called when the user wants to return to restore confirmation.
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text(l10n.restoreBackupInfoTitle, style: AppConst.h1)),
          const SizedBox(height: 24),
          Text(l10n.restoreBackupInfoDescription, style: AppConst.text),
          const SizedBox(height: 20),
          RestoreBackupInfoRow(text: l10n.restoreBackupInfoFileRule),
          RestoreBackupInfoRow(text: l10n.restoreBackupInfoReplacementRule),
          RestoreBackupInfoRow(text: l10n.restoreBackupInfoProgressRule),
          RestoreBackupInfoRow(text: l10n.restoreBackupInfoCancelRule),
          const SizedBox(height: 24),
          Center(
            child: SizedBox(
              height: 55,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: AppConst.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back, size: 20),
                label: Text(
                  l10n.restoreBackupInfoBackButton,
                  style: AppConst.text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
