import 'package:flashcards_learning_app/blocs/locale_bloc/locale_bloc.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSwitchButton extends StatelessWidget {
  const LanguageSwitchButton({super.key});

  static const double _menuWidth = 178;
  static const double _menuRadius = 18;
  static const double _tileRadius = 14;

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return BlocBuilder<LocaleBloc, LocaleState>(
      buildWhen: (previous, current) => previous.locale != current.locale,
      builder: (context, state) {
        return Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          child: PopupMenuButton<Locale>(
            key: const ValueKey('language_switch_button'),
            tooltip: l10n.languageSwitchTooltip,
            color: AppConst.dialogbackground,
            elevation: 0,
            offset: const Offset(0, 8),
            constraints: const BoxConstraints.tightFor(width: _menuWidth),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_menuRadius),
              side: const BorderSide(color: AppConst.primary, width: 2),
            ),
            icon: const Icon(Icons.language, color: AppConst.black),
            initialValue: state.locale,
            onSelected: (locale) {
              context.read<LocaleBloc>().add(
                LocaleEvent.localeChanged(locale: locale),
              );
            },
            itemBuilder: (context) => [
              _languageItem(
                locale: const Locale('en'),
                label: l10n.languageEnglish,
                isSelected: state.locale.languageCode == 'en',
              ),
              _languageItem(
                locale: const Locale('ru'),
                label: l10n.languageRussian,
                isSelected: state.locale.languageCode == 'ru',
              ),
            ],
          ),
        );
      },
    );
  }

  PopupMenuEntry<Locale> _languageItem({
    required Locale locale,
    required String label,
    required bool isSelected,
  }) {
    return PopupMenuItem<Locale>(
      value: locale,

      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected ? AppConst.primary : AppConst.buttonBackground,
          borderRadius: BorderRadius.circular(_tileRadius),
          border: Border.all(
            color: isSelected ? AppConst.black : AppConst.transparent,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: isSelected ? AppConst.black : AppConst.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppConst.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    isSelected ? Icons.check : Icons.translate,
                    size: 14,
                    color: isSelected ? AppConst.primary : AppConst.black,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppConst.text.copyWith(
                    fontWeight: isSelected
                        ? FontWeight.w500
                        : AppConst.text.fontWeight,
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
