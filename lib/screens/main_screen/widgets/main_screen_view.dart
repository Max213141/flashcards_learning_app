// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flashcards_learning_app/blocs/blocs.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/languge_switch/widgets.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/analytics_service.dart';
import 'package:flashcards_learning_app/utils/crashlytics_consent_manager.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  bool buttonsHidden = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maybeAskCrashlyticsConsent();
    });
  }

  Future<void> _maybeAskCrashlyticsConsent() async {
    final storedConsent = await CrashlyticsConsentManager.getStoredConsent();
    if (storedConsent != null || !mounted) {
      return;
    }

    final hasConsent = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const PopUpBox(popupContent: CrashlyticsConsentBody()),
    );

    if (hasConsent == null || !mounted) {
      return;
    }

    await CrashlyticsConsentManager.setConsent(hasConsent);
  }

  Future<void> _onRestoreBackupTap() async {
    closeFloatingActionButton();
    final shouldRestore = await showDialog<bool>(
      context: context,
      builder: (context) =>
          const PopUpBox(popupContent: RestoreBackupAcceptanceBody()),
    );
    if (shouldRestore != true) return;
    if (!mounted) return;
    getIt<AnalyticsService>().logBackupRestoreRequested();
    context.read<BackupBloc>().add(const BackupEvent.restoreRequested());
  }

  void _showSnack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void triggerFloatingActionButton() {
    setState(() {
      buttonsHidden = !buttonsHidden;
    });
  }

  void closeFloatingActionButton() {
    if (buttonsHidden) return;
    setState(() {
      buttonsHidden = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return BlocListener<BackupBloc, BackupState>(
      listener: (context, state) {
        state.whenOrNull(
          exportSuccess: (message) {
            _showSnack(message);
            context.read<BackupBloc>().add(const BackupEvent.statusConsumed());
          },
          restoreSuccess: (_, message) {
            context.read<TopicBloc>().add(const TopicEvent.refreshRequested());
            _showSnack(message);
            context.read<BackupBloc>().add(const BackupEvent.statusConsumed());
          },
          failure: (message) {
            _showSnack(message);
            context.read<BackupBloc>().add(const BackupEvent.statusConsumed());
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConst.primary,
          elevation: 0,
          scrolledUnderElevation: 0,
          actions: const [LanguageSwitchButton()],
        ),
        backgroundColor: AppConst.background,
        floatingActionButton: RotatingFab(
          isOpen: !buttonsHidden,
          onPressed: triggerFloatingActionButton,
        ),
        body: Column(
          children: [
            AppBarCustomizedWidget(),
            Expanded(
              child: BlocBuilder<TopicBloc, TopicState>(
                builder: (context, state) {
                  final topicsContent = state.when(
                    initial: (_) => const Center(child: FlashcardsLoader()),
                    loading: (_, previousTopics) => previousTopics.isEmpty
                        ? const Center(child: FlashcardsLoader())
                        : TopicsListWidget(topics: previousTopics),
                    loaded: (_, topics) => TopicsListWidget(topics: topics),
                    error: (_, message, previousTopics) =>
                        previousTopics.isEmpty
                        ? Center(child: Text(message))
                        : TopicsListWidget(topics: previousTopics),
                  );

                  return Column(
                    children: [
                      FilterButtonWidget(
                        selectedSort: state.selectedSort,
                        onSortChanged: (option) {
                          context.read<TopicBloc>().add(
                            TopicEvent.sortChanged(sortOption: option),
                          );
                        },
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentGeometry.topCenter,
                              child: topicsContent,
                            ),

                            // if (kDebugMode)
                            //   Center(
                            //     child: CustomActionButton(
                            //       buttonText: 'Crash Test',
                            //       onTap: () {
                            //         // FirebaseCrashlytics.instance.crash();
                            //         throw Exception();
                            //       },
                            //     ),
                            //   ),
                            Positioned(
                              right: 30,
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 85,
                              child: Offstage(
                                offstage: buttonsHidden,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomActionButton(
                                      buttonText:
                                          l10n.mainScreenRestoreBackupButton,
                                      icon: 'assets/iconss/unarchive.svg',
                                      onTap: _onRestoreBackupTap,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                      ),
                                      child: CustomActionButton(
                                        buttonText:
                                            l10n.mainScreenCreateBackupButton,
                                        icon: 'assets/iconss/archive.svg',
                                        onTap: () {
                                          closeFloatingActionButton();

                                          getIt<AnalyticsService>()
                                              .logBackupExportRequested();
                                          context.read<BackupBloc>().add(
                                            const BackupEvent.exportRequested(),
                                          );
                                        },
                                      ),
                                    ),
                                    CustomActionButton(
                                      buttonText: l10n.mainScreenNewTopicButton,
                                      icon: 'assets/iconss/plus.svg',
                                      onTap: () async {
                                        closeFloatingActionButton();

                                        final created = await showDialog<bool>(
                                          context: context,
                                          builder: (dialogContext) =>
                                              BlocProvider(
                                                create: (_) =>
                                                    getIt<TopicCreationBloc>(),
                                                child: PopUpBox(
                                                  popupContent:
                                                      PopUpBodyWidget(),
                                                ),
                                              ),
                                        );
                                        if (!context.mounted ||
                                            created != true) {
                                          return;
                                        }
                                        getIt<AnalyticsService>()
                                            .logTopicCreated();

                                        context.read<TopicBloc>().add(
                                          const TopicEvent.refreshRequested(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
