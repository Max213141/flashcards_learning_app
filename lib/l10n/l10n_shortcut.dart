import 'package:flashcards_learning_app/l10n/generated/app_localizations.dart';
import 'package:flashcards_learning_app/l10n/generated/app_localizations_en.dart';
import 'package:flutter/material.dart';

AppLocalizations l10nOf(BuildContext context) =>
    AppLocalizations.of(context) ?? AppLocalizationsEn();
