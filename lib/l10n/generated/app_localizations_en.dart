// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flashy Learn';

  @override
  String get commonAppBarStatistics => 'Statistics';

  @override
  String get editFormLearningWordLabel => 'Word to learn';

  @override
  String get editFormTranslationLabel => 'Translation';

  @override
  String get editFormAdditionalSection => 'Additional';

  @override
  String get editFormTranscriptionLabel => 'Transcription';

  @override
  String get editFormPartOfSpeechLabel => 'Part of speech';

  @override
  String get editFormUsageLabel => 'Usage';

  @override
  String get editWordFormRequiredFieldsError =>
      'Fill in the word and translation';

  @override
  String get editWordFormSavingButton => 'Saving...';

  @override
  String get editWordFormSaveButton => 'Save';

  @override
  String get aiWordFormInputRequiredError => 'Enter a word or phrase';

  @override
  String get aiWordFormRequiredFieldsError =>
      'Fill in the word and translation';

  @override
  String get aiWordFormSavingButton => 'Saving...';

  @override
  String get aiWordFormSaveButton => 'Save';

  @override
  String get aiDraftControlsTitle => 'AI draft';

  @override
  String get aiDraftControlsGenerateTranslationButton => 'Generate translation';

  @override
  String get wordDefinitionPartOfSpeechMissing =>
      'Part of speech is not specified';

  @override
  String get wordDefinitionTranslationTitle => 'Translation';

  @override
  String get wordDefinitionUsageTitle => 'Word in use';

  @override
  String get wordDefinitionInfoMissing => 'Information is not filled in';

  @override
  String get wordDefinitionScreenTitle => 'Definition';

  @override
  String get wordDescriptionUsageTitle => 'Word in use';

  @override
  String get wordDescriptionInfoMissing => 'Information is not filled in';

  @override
  String get testScreenTitle => 'Practice';

  @override
  String get finishedTestTitle => 'Test completed';

  @override
  String finishedTestCorrectCount(int count) {
    return 'Correct: $count';
  }

  @override
  String finishedTestIncorrectCount(int count) {
    return 'Incorrect: $count';
  }

  @override
  String finishedTestTotalCount(int count) {
    return 'Total: $count';
  }

  @override
  String get finishedTestOkButton => 'OK';

  @override
  String get topicAddWordDialogTitle => 'Add word';

  @override
  String get topicWordsEmpty => 'No words';

  @override
  String topicScreenWordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count words',
      one: '1 word',
      zero: '0 words',
    );
    return '$_temp0';
  }

  @override
  String get topicScreenOverallProgressLabel => 'Overall \nprogress';

  @override
  String get topicScreenAiAssistantButton => 'AI assistant';

  @override
  String get topicScreenAddJsonFileButton => 'Add JSON file';

  @override
  String get topicScreenAddWordButton => 'Add word';

  @override
  String get editWordDialogTitle => 'Edit word';

  @override
  String get slidableWordDeleteAction => 'Delete';

  @override
  String get slidableWordEditAction => 'Edit';

  @override
  String deletionAcceptanceTitle(String topicName) {
    return 'Are you sure you want to delete “$topicName”?';
  }

  @override
  String get deletionAcceptanceMessage =>
      'All words and your progress will be permanently deleted';

  @override
  String get deletionAcceptanceCancelButton => 'Cancel';

  @override
  String get deletionAcceptanceDeleteButton => 'Delete';

  @override
  String get buttonsRowPracticeButton => 'Practice';

  @override
  String get buttonsRowExamButton => 'Exam';

  @override
  String get addWordAiDialogTitle => 'AI assistant';

  @override
  String get aiModelSetupCheckingMessage => 'Checking local model';

  @override
  String get aiModelSetupRequiredTitle => 'Local model required';

  @override
  String aiModelSetupDescription(String modelName, String modelSize) {
    return '$modelName (~$modelSize) will be downloaded to the device. After that, the AI assistant will work locally on the device';
  }

  @override
  String get aiModelSetupDownloadingButton => 'Downloading...';

  @override
  String get aiModelSetupRetryButton => 'Retry';

  @override
  String get aiModelSetupDownloadButton => 'Download';

  @override
  String get aiModelSetupCancelButton => 'Cancel';

  @override
  String get aiModelSetupNotNowButton => 'Not now';

  @override
  String get editWordScreenTitle => 'Edit word';

  @override
  String get examScreenLoadFailure => 'Failed to load words for the exam';

  @override
  String get examScreenTitle => 'Exam';

  @override
  String get examFinishedTitle => 'Exam completed';

  @override
  String examFinishedTotalCount(int count) {
    return 'Total: $count';
  }

  @override
  String get examFinishedOkButton => 'OK';

  @override
  String get mainAppBarSetGoalsPrompt => 'Set your goals!';

  @override
  String get mainAppBarOverallProgressLabel => 'Overall \nprogress';

  @override
  String get mainAppBarDailyGoalLabel => 'Daily \ngoal';

  @override
  String get filterButtonTitleAscSort => 'By name (A-Z)';

  @override
  String get filterButtonColorAscSort => 'By color';

  @override
  String get filterButtonCreatedDescSort => 'Newest first';

  @override
  String get filterButtonSortButton => 'Sort by';

  @override
  String filterButtonCurrentSort(String sortLabel) {
    return 'Current sort: $sortLabel';
  }

  @override
  String get topicsListEmpty => 'No topics yet';

  @override
  String get topicsExpansionJsonTopicsTitle => 'Topics from JSON';

  @override
  String get restoreBackupTitle => 'Restore data from backup?';

  @override
  String get restoreBackupMessage =>
      'Current topics, words, and progress will be fully replaced with data from the backup';

  @override
  String get restoreBackupCancelButton => 'Cancel';

  @override
  String get restoreBackupRestoreButton => 'Restore';

  @override
  String get crashlyticsConsentTitle =>
      'Allow anonymous analytics and crash reports?';

  @override
  String get crashlyticsConsentMessage =>
      'This helps understand how you use the app and fix errors faster. You can change your choice later.';

  @override
  String get crashlyticsConsentNotNowButton => 'Not now';

  @override
  String get crashlyticsConsentAllowButton => 'Allow';

  @override
  String get goalsDialogTitle => 'Learning goals';

  @override
  String get goalsDialogOverallGoalLabel => 'Overall goal';

  @override
  String get goalsDialogDailyGoalLabel => 'Daily goal';

  @override
  String get goalsDialogSaveButton => 'Save';

  @override
  String get popUpBodyNewTopicTitle => 'New topic';

  @override
  String get popUpBodyNameLabel => 'Name';

  @override
  String get popUpBodyTopicColorLabel => 'Topic color';

  @override
  String get popUpBodyUploadJsonButton => 'Upload JSON file';

  @override
  String get popUpBodyCreateTopicButton => 'Create topic';

  @override
  String get mainScreenRestoreBackupButton => 'Restore from backup';

  @override
  String get mainScreenCreateBackupButton => 'Create backup';

  @override
  String get mainScreenNewTopicButton => 'New topic';

  @override
  String get sortMenuCreatedDescOption => 'Newest first';

  @override
  String get sortMenuTitleAscOption => 'By name (A-Z)';

  @override
  String get sortMenuColorAscOption => 'By color';
}
