import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// The application title shown by the root MaterialApp.
  ///
  /// In en, this message translates to:
  /// **'Flashy Learn'**
  String get appTitle;

  /// No description provided for @onboardingSkipButton.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkipButton;

  /// No description provided for @onboardingNextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNextButton;

  /// No description provided for @onboardingStartButton.
  ///
  /// In en, this message translates to:
  /// **'Start learning'**
  String get onboardingStartButton;

  /// No description provided for @onboardingCreateDecksTitle.
  ///
  /// In en, this message translates to:
  /// **'Create focused decks'**
  String get onboardingCreateDecksTitle;

  /// No description provided for @onboardingCreateDecksDescription.
  ///
  /// In en, this message translates to:
  /// **'Group words by topic and keep each collection ready for quick study sessions.'**
  String get onboardingCreateDecksDescription;

  /// No description provided for @onboardingPracticeCardsTitle.
  ///
  /// In en, this message translates to:
  /// **'Practice with cards'**
  String get onboardingPracticeCardsTitle;

  /// No description provided for @onboardingPracticeCardsDescription.
  ///
  /// In en, this message translates to:
  /// **'Swipe through flashcards, check definitions, and repeat the words that need more attention.'**
  String get onboardingPracticeCardsDescription;

  /// No description provided for @onboardingTrackProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Track your progress'**
  String get onboardingTrackProgressTitle;

  /// No description provided for @onboardingTrackProgressDescription.
  ///
  /// In en, this message translates to:
  /// **'Set learning goals and review your progress as your vocabulary grows.'**
  String get onboardingTrackProgressDescription;

  /// No description provided for @commonAppBarStatistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get commonAppBarStatistics;

  /// No description provided for @editFormLearningWordLabel.
  ///
  /// In en, this message translates to:
  /// **'Word to learn'**
  String get editFormLearningWordLabel;

  /// No description provided for @editFormTranslationLabel.
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get editFormTranslationLabel;

  /// No description provided for @editFormAdditionalSection.
  ///
  /// In en, this message translates to:
  /// **'Additional'**
  String get editFormAdditionalSection;

  /// No description provided for @editFormTranscriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Transcription'**
  String get editFormTranscriptionLabel;

  /// No description provided for @editFormPartOfSpeechLabel.
  ///
  /// In en, this message translates to:
  /// **'Part of speech'**
  String get editFormPartOfSpeechLabel;

  /// No description provided for @editFormUsageLabel.
  ///
  /// In en, this message translates to:
  /// **'Usage'**
  String get editFormUsageLabel;

  /// No description provided for @editWordFormRequiredFieldsError.
  ///
  /// In en, this message translates to:
  /// **'Fill in the word and translation'**
  String get editWordFormRequiredFieldsError;

  /// No description provided for @editWordFormSavingButton.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get editWordFormSavingButton;

  /// No description provided for @editWordFormSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get editWordFormSaveButton;

  /// No description provided for @aiWordFormInputRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Enter a word or phrase'**
  String get aiWordFormInputRequiredError;

  /// No description provided for @aiWordFormRequiredFieldsError.
  ///
  /// In en, this message translates to:
  /// **'Fill in the word and translation'**
  String get aiWordFormRequiredFieldsError;

  /// No description provided for @aiWordFormSavingButton.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get aiWordFormSavingButton;

  /// No description provided for @aiWordFormSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get aiWordFormSaveButton;

  /// No description provided for @aiDraftControlsTitle.
  ///
  /// In en, this message translates to:
  /// **'AI draft'**
  String get aiDraftControlsTitle;

  /// No description provided for @aiDraftControlsGenerateTranslationButton.
  ///
  /// In en, this message translates to:
  /// **'Generate translation'**
  String get aiDraftControlsGenerateTranslationButton;

  /// No description provided for @wordDefinitionPartOfSpeechMissing.
  ///
  /// In en, this message translates to:
  /// **'Part of speech is not specified'**
  String get wordDefinitionPartOfSpeechMissing;

  /// No description provided for @wordDefinitionTranslationTitle.
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get wordDefinitionTranslationTitle;

  /// No description provided for @wordDefinitionUsageTitle.
  ///
  /// In en, this message translates to:
  /// **'Word in use'**
  String get wordDefinitionUsageTitle;

  /// No description provided for @wordDefinitionInfoMissing.
  ///
  /// In en, this message translates to:
  /// **'Information is not filled in'**
  String get wordDefinitionInfoMissing;

  /// No description provided for @wordDefinitionScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Definition'**
  String get wordDefinitionScreenTitle;

  /// No description provided for @wordDescriptionUsageTitle.
  ///
  /// In en, this message translates to:
  /// **'Word in use'**
  String get wordDescriptionUsageTitle;

  /// No description provided for @wordDescriptionInfoMissing.
  ///
  /// In en, this message translates to:
  /// **'Information is not filled in'**
  String get wordDescriptionInfoMissing;

  /// No description provided for @testScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get testScreenTitle;

  /// No description provided for @finishedTestTitle.
  ///
  /// In en, this message translates to:
  /// **'Test completed'**
  String get finishedTestTitle;

  /// No description provided for @finishedTestCorrectCount.
  ///
  /// In en, this message translates to:
  /// **'Correct: {count}'**
  String finishedTestCorrectCount(int count);

  /// No description provided for @finishedTestIncorrectCount.
  ///
  /// In en, this message translates to:
  /// **'Incorrect: {count}'**
  String finishedTestIncorrectCount(int count);

  /// No description provided for @finishedTestTotalCount.
  ///
  /// In en, this message translates to:
  /// **'Total: {count}'**
  String finishedTestTotalCount(int count);

  /// No description provided for @finishedTestOkButton.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get finishedTestOkButton;

  /// No description provided for @topicAddWordDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add word'**
  String get topicAddWordDialogTitle;

  /// No description provided for @topicAddWordInfoTooltip.
  ///
  /// In en, this message translates to:
  /// **'How word creation works'**
  String get topicAddWordInfoTooltip;

  /// No description provided for @topicAddWordInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Word creation'**
  String get topicAddWordInfoTitle;

  /// No description provided for @topicAddWordInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'Add a word manually when you want to create a single flashcard in this topic.'**
  String get topicAddWordInfoDescription;

  /// No description provided for @topicAddWordInfoWordRule.
  ///
  /// In en, this message translates to:
  /// **'Word to learn is required. Use the foreign word or phrase you want to practice.'**
  String get topicAddWordInfoWordRule;

  /// No description provided for @topicAddWordInfoTranslationRule.
  ///
  /// In en, this message translates to:
  /// **'Translation is required. Use the meaning in your native or target translation language.'**
  String get topicAddWordInfoTranslationRule;

  /// No description provided for @topicAddWordInfoOptionalFieldsRule.
  ///
  /// In en, this message translates to:
  /// **'The Additional section is optional. You can leave it empty and save the word.'**
  String get topicAddWordInfoOptionalFieldsRule;

  /// No description provided for @topicAddWordInfoTranscriptionRule.
  ///
  /// In en, this message translates to:
  /// **'Transcription is optional and is useful for pronunciation notes.'**
  String get topicAddWordInfoTranscriptionRule;

  /// No description provided for @topicAddWordInfoPartOfSpeechRule.
  ///
  /// In en, this message translates to:
  /// **'Part of speech is optional, for example noun, verb, adjective, phrase, or idiom.'**
  String get topicAddWordInfoPartOfSpeechRule;

  /// No description provided for @topicAddWordInfoUsageRule.
  ///
  /// In en, this message translates to:
  /// **'Usage is optional. Add a short example sentence if it helps you remember the word.'**
  String get topicAddWordInfoUsageRule;

  /// No description provided for @topicAddWordInfoSaveRule.
  ///
  /// In en, this message translates to:
  /// **'After saving, the word is added to the current topic and becomes available for practice.'**
  String get topicAddWordInfoSaveRule;

  /// No description provided for @topicAddWordInfoBackButton.
  ///
  /// In en, this message translates to:
  /// **'Back to word'**
  String get topicAddWordInfoBackButton;

  /// No description provided for @topicWordsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No words'**
  String get topicWordsEmpty;

  /// No description provided for @topicScreenWordsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 words} =1{1 word} other{{count} words}}'**
  String topicScreenWordsCount(int count);

  /// No description provided for @topicScreenOverallProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Overall \nprogress'**
  String get topicScreenOverallProgressLabel;

  /// No description provided for @topicScreenAiAssistantButton.
  ///
  /// In en, this message translates to:
  /// **'AI assistant'**
  String get topicScreenAiAssistantButton;

  /// No description provided for @topicScreenAddJsonFileButton.
  ///
  /// In en, this message translates to:
  /// **'Add JSON file'**
  String get topicScreenAddJsonFileButton;

  /// No description provided for @topicScreenAddWordButton.
  ///
  /// In en, this message translates to:
  /// **'Add word'**
  String get topicScreenAddWordButton;

  /// No description provided for @editWordDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit word'**
  String get editWordDialogTitle;

  /// No description provided for @slidableWordDeleteAction.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get slidableWordDeleteAction;

  /// No description provided for @slidableWordEditAction.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get slidableWordEditAction;

  /// No description provided for @deletionAcceptanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete “{topicName}”?'**
  String deletionAcceptanceTitle(String topicName);

  /// No description provided for @deletionAcceptanceMessage.
  ///
  /// In en, this message translates to:
  /// **'All words and your progress will be permanently deleted'**
  String get deletionAcceptanceMessage;

  /// No description provided for @deletionAcceptanceCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get deletionAcceptanceCancelButton;

  /// No description provided for @deletionAcceptanceDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deletionAcceptanceDeleteButton;

  /// No description provided for @buttonsRowPracticeButton.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get buttonsRowPracticeButton;

  /// No description provided for @buttonsRowExamButton.
  ///
  /// In en, this message translates to:
  /// **'Exam'**
  String get buttonsRowExamButton;

  /// No description provided for @addWordAiDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'AI assistant'**
  String get addWordAiDialogTitle;

  /// No description provided for @aiModelSetupCheckingMessage.
  ///
  /// In en, this message translates to:
  /// **'Checking local model'**
  String get aiModelSetupCheckingMessage;

  /// No description provided for @aiModelSetupRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Local model required'**
  String get aiModelSetupRequiredTitle;

  /// No description provided for @aiModelSetupDescription.
  ///
  /// In en, this message translates to:
  /// **'{modelName} (~{modelSize}) will be downloaded to the device. After that, the AI assistant will work locally on the device'**
  String aiModelSetupDescription(String modelName, String modelSize);

  /// No description provided for @aiModelSetupDownloadingButton.
  ///
  /// In en, this message translates to:
  /// **'Downloading...'**
  String get aiModelSetupDownloadingButton;

  /// No description provided for @aiModelSetupRetryButton.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get aiModelSetupRetryButton;

  /// No description provided for @aiModelSetupDownloadButton.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get aiModelSetupDownloadButton;

  /// No description provided for @aiModelSetupCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get aiModelSetupCancelButton;

  /// No description provided for @aiModelSetupNotNowButton.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get aiModelSetupNotNowButton;

  /// No description provided for @editWordScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit word'**
  String get editWordScreenTitle;

  /// No description provided for @examScreenLoadFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to load words for the exam'**
  String get examScreenLoadFailure;

  /// No description provided for @examScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Exam'**
  String get examScreenTitle;

  /// No description provided for @examFinishedTitle.
  ///
  /// In en, this message translates to:
  /// **'Exam completed'**
  String get examFinishedTitle;

  /// No description provided for @examFinishedTotalCount.
  ///
  /// In en, this message translates to:
  /// **'Total: {count}'**
  String examFinishedTotalCount(int count);

  /// No description provided for @examFinishedOkButton.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get examFinishedOkButton;

  /// No description provided for @mainAppBarSetGoalsPrompt.
  ///
  /// In en, this message translates to:
  /// **'Set your goals!'**
  String get mainAppBarSetGoalsPrompt;

  /// No description provided for @mainAppBarOverallProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Overall \nprogress'**
  String get mainAppBarOverallProgressLabel;

  /// No description provided for @mainAppBarDailyGoalLabel.
  ///
  /// In en, this message translates to:
  /// **'Daily \ngoal'**
  String get mainAppBarDailyGoalLabel;

  /// No description provided for @filterButtonTitleAscSort.
  ///
  /// In en, this message translates to:
  /// **'By name (A-Z)'**
  String get filterButtonTitleAscSort;

  /// No description provided for @filterButtonColorAscSort.
  ///
  /// In en, this message translates to:
  /// **'By color'**
  String get filterButtonColorAscSort;

  /// No description provided for @filterButtonCreatedDescSort.
  ///
  /// In en, this message translates to:
  /// **'Newest first'**
  String get filterButtonCreatedDescSort;

  /// No description provided for @filterButtonSortButton.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get filterButtonSortButton;

  /// No description provided for @filterButtonCurrentSort.
  ///
  /// In en, this message translates to:
  /// **'Current sort: {sortLabel}'**
  String filterButtonCurrentSort(String sortLabel);

  /// No description provided for @topicsListEmpty.
  ///
  /// In en, this message translates to:
  /// **'No topics yet'**
  String get topicsListEmpty;

  /// No description provided for @topicsExpansionJsonTopicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Topics from JSON'**
  String get topicsExpansionJsonTopicsTitle;

  /// No description provided for @restoreBackupTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore data from backup?'**
  String get restoreBackupTitle;

  /// No description provided for @restoreBackupMessage.
  ///
  /// In en, this message translates to:
  /// **'Current topics, words, and progress will be fully replaced with data from the backup'**
  String get restoreBackupMessage;

  /// No description provided for @restoreBackupCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get restoreBackupCancelButton;

  /// No description provided for @restoreBackupRestoreButton.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restoreBackupRestoreButton;

  /// No description provided for @restoreBackupInfoTooltip.
  ///
  /// In en, this message translates to:
  /// **'How backup restoration works'**
  String get restoreBackupInfoTooltip;

  /// No description provided for @restoreBackupInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Backup restoration'**
  String get restoreBackupInfoTitle;

  /// No description provided for @restoreBackupInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'Restoring backup data loads a saved JSON backup and uses it as the current app data.'**
  String get restoreBackupInfoDescription;

  /// No description provided for @restoreBackupInfoFileRule.
  ///
  /// In en, this message translates to:
  /// **'After you confirm, choose a backup .json file created by this app.'**
  String get restoreBackupInfoFileRule;

  /// No description provided for @restoreBackupInfoReplacementRule.
  ///
  /// In en, this message translates to:
  /// **'The selected backup replaces the current topics and words on this device.'**
  String get restoreBackupInfoReplacementRule;

  /// No description provided for @restoreBackupInfoProgressRule.
  ///
  /// In en, this message translates to:
  /// **'Learning progress saved in the backup, such as learned words and learned dates, is restored with the words.'**
  String get restoreBackupInfoProgressRule;

  /// No description provided for @restoreBackupInfoCancelRule.
  ///
  /// In en, this message translates to:
  /// **'If you cancel the file picker, nothing is changed.'**
  String get restoreBackupInfoCancelRule;

  /// No description provided for @restoreBackupInfoBackButton.
  ///
  /// In en, this message translates to:
  /// **'Back to restore'**
  String get restoreBackupInfoBackButton;

  /// No description provided for @crashlyticsConsentTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow anonymous analytics and crash reports?'**
  String get crashlyticsConsentTitle;

  /// No description provided for @crashlyticsConsentMessage.
  ///
  /// In en, this message translates to:
  /// **'This helps understand how you use the app and fix errors faster. You can change your choice later.'**
  String get crashlyticsConsentMessage;

  /// No description provided for @crashlyticsConsentNotNowButton.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get crashlyticsConsentNotNowButton;

  /// No description provided for @crashlyticsConsentAllowButton.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get crashlyticsConsentAllowButton;

  /// No description provided for @goalsDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Learning goals'**
  String get goalsDialogTitle;

  /// No description provided for @goalsDialogOverallGoalLabel.
  ///
  /// In en, this message translates to:
  /// **'Overall goal'**
  String get goalsDialogOverallGoalLabel;

  /// No description provided for @goalsDialogDailyGoalLabel.
  ///
  /// In en, this message translates to:
  /// **'Daily goal'**
  String get goalsDialogDailyGoalLabel;

  /// No description provided for @goalsDialogSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get goalsDialogSaveButton;

  /// No description provided for @popUpBodyNewTopicTitle.
  ///
  /// In en, this message translates to:
  /// **'New topic'**
  String get popUpBodyNewTopicTitle;

  /// No description provided for @popUpBodyNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get popUpBodyNameLabel;

  /// No description provided for @popUpBodyTopicColorLabel.
  ///
  /// In en, this message translates to:
  /// **'Topic color'**
  String get popUpBodyTopicColorLabel;

  /// No description provided for @popUpBodyUploadJsonButton.
  ///
  /// In en, this message translates to:
  /// **'Upload JSON file'**
  String get popUpBodyUploadJsonButton;

  /// No description provided for @popUpBodyCreateTopicButton.
  ///
  /// In en, this message translates to:
  /// **'Create topic'**
  String get popUpBodyCreateTopicButton;

  /// No description provided for @popUpBodyJsonInfoTooltip.
  ///
  /// In en, this message translates to:
  /// **'How JSON import works'**
  String get popUpBodyJsonInfoTooltip;

  /// No description provided for @popUpBodyJsonInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Topic creation and JSON import'**
  String get popUpBodyJsonInfoTitle;

  /// No description provided for @popUpBodyJsonInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'You can create a topic manually or import a prepared JSON file when you want to add many flashcards at once.'**
  String get popUpBodyJsonInfoDescription;

  /// No description provided for @popUpBodyJsonInfoManualTopicFlow.
  ///
  /// In en, this message translates to:
  /// **'Simple flow: enter a topic name, choose a color, then tap Create topic. This creates an empty topic that you can fill later.'**
  String get popUpBodyJsonInfoManualTopicFlow;

  /// No description provided for @popUpBodyJsonInfoImportFlow.
  ///
  /// In en, this message translates to:
  /// **'JSON flow: tap Upload JSON file, select a .json file, review the detected topic name if the file contains one, then create the topic with all imported words.'**
  String get popUpBodyJsonInfoImportFlow;

  /// No description provided for @popUpBodyJsonInfoArrayRule.
  ///
  /// In en, this message translates to:
  /// **'The file must contain one JSON array, not a single object.'**
  String get popUpBodyJsonInfoArrayRule;

  /// No description provided for @popUpBodyJsonInfoRequiredFields.
  ///
  /// In en, this message translates to:
  /// **'Every item must include word and translation as text values.'**
  String get popUpBodyJsonInfoRequiredFields;

  /// No description provided for @popUpBodyJsonInfoOptionalFields.
  ///
  /// In en, this message translates to:
  /// **'Optional fields: topic, transcription, partOfSpeech, usage, learned, learnedAt.'**
  String get popUpBodyJsonInfoOptionalFields;

  /// No description provided for @popUpBodyJsonInfoTopicRule.
  ///
  /// In en, this message translates to:
  /// **'If the file contains topic values, you can pick one of them as the new topic name before creating it.'**
  String get popUpBodyJsonInfoTopicRule;

  /// No description provided for @popUpBodyJsonInfoPromptRule.
  ///
  /// In en, this message translates to:
  /// **'The Copy AI prompt button copies a ready prompt for generating a JSON file. BEFORE USING IT, FILL SOURCE LANGUAGE, TARGET LANGUAGE, AND TOPIC.'**
  String get popUpBodyJsonInfoPromptRule;

  /// No description provided for @popUpBodyJsonExampleTitle.
  ///
  /// In en, this message translates to:
  /// **'Example format'**
  String get popUpBodyJsonExampleTitle;

  /// No description provided for @popUpBodyJsonCopyPromptButton.
  ///
  /// In en, this message translates to:
  /// **'Copy AI prompt'**
  String get popUpBodyJsonCopyPromptButton;

  /// No description provided for @popUpBodyJsonPromptCopied.
  ///
  /// In en, this message translates to:
  /// **'Prompt copied'**
  String get popUpBodyJsonPromptCopied;

  /// No description provided for @popUpBodyJsonBackButton.
  ///
  /// In en, this message translates to:
  /// **'Back to topic'**
  String get popUpBodyJsonBackButton;

  /// No description provided for @mainScreenRestoreBackupButton.
  ///
  /// In en, this message translates to:
  /// **'Restore from backup'**
  String get mainScreenRestoreBackupButton;

  /// No description provided for @mainScreenCreateBackupButton.
  ///
  /// In en, this message translates to:
  /// **'Create backup'**
  String get mainScreenCreateBackupButton;

  /// No description provided for @mainScreenNewTopicButton.
  ///
  /// In en, this message translates to:
  /// **'New topic'**
  String get mainScreenNewTopicButton;

  /// No description provided for @sortMenuCreatedDescOption.
  ///
  /// In en, this message translates to:
  /// **'Newest first'**
  String get sortMenuCreatedDescOption;

  /// No description provided for @sortMenuTitleAscOption.
  ///
  /// In en, this message translates to:
  /// **'By name (A-Z)'**
  String get sortMenuTitleAscOption;

  /// No description provided for @sortMenuColorAscOption.
  ///
  /// In en, this message translates to:
  /// **'By color'**
  String get sortMenuColorAscOption;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
