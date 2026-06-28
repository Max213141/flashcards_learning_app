// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Flashy Learn';

  @override
  String get onboardingSkipButton => 'Пропустить';

  @override
  String get onboardingNextButton => 'Далее';

  @override
  String get onboardingStartButton => 'Начать обучение';

  @override
  String get onboardingCreateDecksTitle => 'Создавайте удобные наборы';

  @override
  String get onboardingCreateDecksDescription =>
      'Группируйте слова по темам и держите каждую коллекцию готовой для коротких занятий.';

  @override
  String get onboardingPracticeCardsTitle => 'Тренируйтесь с карточками';

  @override
  String get onboardingPracticeCardsDescription =>
      'Листайте карточки, проверяйте определения и повторяйте слова, которым нужно больше внимания.';

  @override
  String get onboardingTrackProgressTitle => 'Следите за прогрессом';

  @override
  String get onboardingTrackProgressDescription =>
      'Ставьте учебные цели и отслеживайте, как растет ваш словарный запас.';

  @override
  String get commonAppBarStatistics => 'Статистика';

  @override
  String get editFormLearningWordLabel => 'Изучаемое слово';

  @override
  String get editFormTranslationLabel => 'Перевод';

  @override
  String get editFormAdditionalSection => 'Дополнительно';

  @override
  String get editFormTranscriptionLabel => 'Транскрипция';

  @override
  String get editFormPartOfSpeechLabel => 'Часть речи';

  @override
  String get editFormUsageLabel => 'Употребление';

  @override
  String get editWordFormRequiredFieldsError => 'Заполните слово и перевод';

  @override
  String get editWordFormSavingButton => 'Сохранение...';

  @override
  String get editWordFormSaveButton => 'Сохранить';

  @override
  String get aiWordFormInputRequiredError => 'Введите слово или фразу';

  @override
  String get aiWordFormRequiredFieldsError => 'Заполните слово и перевод';

  @override
  String get aiWordFormSavingButton => 'Сохранение...';

  @override
  String get aiWordFormSaveButton => 'Сохранить';

  @override
  String get aiDraftControlsTitle => 'AI черновик';

  @override
  String get aiDraftControlsGenerateTranslationButton =>
      'Сгенерировать перевод';

  @override
  String get wordDefinitionPartOfSpeechMissing => 'Часть речи не указана';

  @override
  String get wordDefinitionTranslationTitle => 'Перевод';

  @override
  String get wordDefinitionUsageTitle => 'Слово в употреблении';

  @override
  String get wordDefinitionInfoMissing => 'Информация не заполнена';

  @override
  String get wordDefinitionScreenTitle => 'Определение';

  @override
  String get wordDescriptionUsageTitle => 'Слово в употреблении';

  @override
  String get wordDescriptionInfoMissing => 'Информация не заполнена';

  @override
  String get testScreenTitle => 'Практика';

  @override
  String get finishedTestTitle => 'Тест завершен';

  @override
  String finishedTestCorrectCount(int count) {
    return 'Правильно: $count';
  }

  @override
  String finishedTestIncorrectCount(int count) {
    return 'Неправильно: $count';
  }

  @override
  String finishedTestTotalCount(int count) {
    return 'Всего: $count';
  }

  @override
  String get finishedTestOkButton => 'Ок';

  @override
  String get topicAddWordDialogTitle => 'Добавление слова';

  @override
  String get topicWordsEmpty => 'Нет слов';

  @override
  String topicScreenWordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count слова',
      many: '$count слов',
      few: '$count слова',
      one: '$count слово',
      zero: '0 слов',
    );
    return '$_temp0';
  }

  @override
  String get topicScreenOverallProgressLabel => 'Общий \nпрогресс';

  @override
  String get topicScreenAiAssistantButton => 'ИИ ассистент';

  @override
  String get topicScreenAddJsonFileButton => 'Добавить файл JSON';

  @override
  String get topicScreenAddWordButton => 'Добавить слово';

  @override
  String get editWordDialogTitle => 'Изменение слова';

  @override
  String get slidableWordDeleteAction => 'Удалить';

  @override
  String get slidableWordEditAction => 'Редактировать';

  @override
  String deletionAcceptanceTitle(String topicName) {
    return 'Вы точно хотите удалить тему “$topicName”?';
  }

  @override
  String get deletionAcceptanceMessage =>
      'Все слова и ваш прогресс удалятся полностью';

  @override
  String get deletionAcceptanceCancelButton => 'Отмена';

  @override
  String get deletionAcceptanceDeleteButton => 'Удалить';

  @override
  String get buttonsRowPracticeButton => 'Практика';

  @override
  String get buttonsRowExamButton => 'Экзамен';

  @override
  String get addWordAiDialogTitle => 'ИИ ассистент';

  @override
  String get aiModelSetupCheckingMessage => 'Проверяем локальную модель';

  @override
  String get aiModelSetupRequiredTitle => 'Нужна локальная модель';

  @override
  String aiModelSetupDescription(String modelName, String modelSize) {
    return '$modelName (~$modelSize) будет скачана на устройство. После этого AI ассистент будет работать локально на устройстве';
  }

  @override
  String get aiModelSetupDownloadingButton => 'Скачивание...';

  @override
  String get aiModelSetupRetryButton => 'Повторить';

  @override
  String get aiModelSetupDownloadButton => 'Скачать';

  @override
  String get aiModelSetupCancelButton => 'Отмена';

  @override
  String get aiModelSetupNotNowButton => 'Не сейчас';

  @override
  String get editWordScreenTitle => 'Изменение слова';

  @override
  String get examScreenLoadFailure => 'Не удалось загрузить слова для экзамена';

  @override
  String get examScreenTitle => 'Экзамен';

  @override
  String get examFinishedTitle => 'Экзамен завершен';

  @override
  String examFinishedTotalCount(int count) {
    return 'Всего: $count';
  }

  @override
  String get examFinishedOkButton => 'Ок';

  @override
  String get mainAppBarSetGoalsPrompt => 'Поставь себе цели!';

  @override
  String get mainAppBarOverallProgressLabel => 'Общий \nпрогресс';

  @override
  String get mainAppBarDailyGoalLabel => 'Дневная \nцель';

  @override
  String get filterButtonTitleAscSort => 'По названию (A-Z)';

  @override
  String get filterButtonColorAscSort => 'По цвету';

  @override
  String get filterButtonCreatedDescSort => 'Сначала новые';

  @override
  String get filterButtonSortButton => 'Сортировать';

  @override
  String filterButtonCurrentSort(String sortLabel) {
    return 'Текущая сортировка: $sortLabel';
  }

  @override
  String get topicsListEmpty => 'Нет ни одной темы';

  @override
  String get topicsExpansionJsonTopicsTitle => 'Темы из JSON';

  @override
  String get restoreBackupTitle => 'Восстановить данные из резервной копии?';

  @override
  String get restoreBackupMessage =>
      'Текущие темы, слова и прогресс будут полностью заменены данными из резервной копии';

  @override
  String get restoreBackupCancelButton => 'Отмена';

  @override
  String get restoreBackupRestoreButton => 'Восстановить';

  @override
  String get crashlyticsConsentTitle =>
      'Разрешить анонимную аналитику и отчёты о сбоях?';

  @override
  String get crashlyticsConsentMessage =>
      'Это помогает понять, как вы используете приложение, и быстрее исправлять ошибки. Вы можете изменить выбор позже.';

  @override
  String get crashlyticsConsentNotNowButton => 'Не сейчас';

  @override
  String get crashlyticsConsentAllowButton => 'Разрешить';

  @override
  String get goalsDialogTitle => 'Цели обучения';

  @override
  String get goalsDialogOverallGoalLabel => 'Общая цель';

  @override
  String get goalsDialogDailyGoalLabel => 'Дневная цель';

  @override
  String get goalsDialogSaveButton => 'Сохранить';

  @override
  String get popUpBodyNewTopicTitle => 'Новая тема';

  @override
  String get popUpBodyNameLabel => 'Название';

  @override
  String get popUpBodyTopicColorLabel => 'Цвет темы';

  @override
  String get popUpBodyUploadJsonButton => 'Загрузить файл JSON';

  @override
  String get popUpBodyCreateTopicButton => 'Создать тему';

  @override
  String get mainScreenRestoreBackupButton => 'Восстановление из копии';

  @override
  String get mainScreenCreateBackupButton => 'Создание резервной копии';

  @override
  String get mainScreenNewTopicButton => 'Новая тема';

  @override
  String get sortMenuCreatedDescOption => 'Сначала новые';

  @override
  String get sortMenuTitleAscOption => 'По имени (А-Я)';

  @override
  String get sortMenuColorAscOption => 'По цвету';
}
