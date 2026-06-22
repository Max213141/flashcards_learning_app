import 'dart:convert';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flashcards_learning_app/blocs/backup_bloc/backup_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/test_words.dart';
import '../../mocks/mock_app_database.dart';

class FakeFilePickerPlatform extends FilePicker {
  String? saveFileResult;
  FilePickerResult? pickFilesResult;
  Exception? saveFileError;
  Exception? pickFilesError;

  @override
  Future<String?> saveFile({
    String? dialogTitle,
    String? fileName,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Uint8List? bytes,
    bool lockParentWindow = false,
  }) async {
    if (saveFileError != null) throw saveFileError!;
    return saveFileResult;
  }

  @override
  Future<FilePickerResult?> pickFiles({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool allowCompression = true,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
    bool lockParentWindow = false,
    int compressionQuality = 0,
    bool readSequential = false,
  }) async {
    if (pickFilesError != null) throw pickFilesError!;
    return pickFilesResult;
  }

  @override
  Future<bool?> clearTemporaryFiles() async => true;

  @override
  Future<String?> getDirectoryPath({
    String? dialogTitle,
    bool lockParentWindow = false,
    String? initialDirectory,
  }) async {
    return null;
  }
}

void main() {
  late MockAppDatabase appDatabase;
  late FakeFilePickerPlatform fakePicker;

  setUp(() {
    appDatabase = MockAppDatabase();
    fakePicker = FakeFilePickerPlatform();
    FilePicker.platform = fakePicker;
  });

  blocTest<BackupBloc, BackupState>(
    'exportRequested writes json file and emits success',
    build: () {
      when(() => appDatabase.getAllWordsWithTopicName()).thenAnswer(
        (_) async => [makeWord(id: 1, topic: 'Animals', transcription: 'kæt')],
      );
      fakePicker.saveFileResult =
          '${Directory.systemTemp.path}/flashcards_backup_test';
      return BackupBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const BackupEvent.exportRequested()),
    wait: const Duration(milliseconds: 100),
    expect: () => const [
      BackupState.processing(operation: BackupOperation.export),
      BackupState.exportSuccess(message: 'Резервная копия сохранена'),
    ],
    verify: (_) {
      final file = File(
        '${Directory.systemTemp.path}/flashcards_backup_test.json',
      );
      expect(file.existsSync(), true);
      final decoded = jsonDecode(file.readAsStringSync()) as List<dynamic>;
      expect(decoded, hasLength(1));
      expect(decoded.first['word'], 'hello');
      file.deleteSync();
    },
  );

  blocTest<BackupBloc, BackupState>(
    'exportRequested with cancelled dialog returns idle',
    build: () {
      when(
        () => appDatabase.getAllWordsWithTopicName(),
      ).thenAnswer((_) async => []);
      fakePicker.saveFileResult = null;
      return BackupBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const BackupEvent.exportRequested()),
    expect: () => const [
      BackupState.processing(operation: BackupOperation.export),
      BackupState.idle(),
    ],
  );

  blocTest<BackupBloc, BackupState>(
    'restoreRequested succeeds with valid JSON payload',
    build: () {
      fakePicker.pickFilesResult = FilePickerResult([
        PlatformFile(
          name: 'backup.json',
          size: 100,
          bytes: Uint8List.fromList(
            utf8.encode(
              jsonEncode([
                {'word': 'hello', 'translation': 'привет', 'learned': true},
              ]),
            ),
          ),
        ),
      ]);
      when(
        () => appDatabase.restoreFromBackupJson(any()),
      ).thenAnswer((_) async => 1);
      return BackupBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const BackupEvent.restoreRequested()),
    expect: () => const [
      BackupState.processing(operation: BackupOperation.restore),
      BackupState.restoreSuccess(
        restoredWordsCount: 1,
        message: 'Восстановлено слов: 1',
      ),
    ],
  );

  blocTest<BackupBloc, BackupState>(
    'restoreRequested handles invalid json structure',
    build: () {
      fakePicker.pickFilesResult = FilePickerResult([
        PlatformFile(
          name: 'backup.json',
          size: 20,
          bytes: Uint8List.fromList(utf8.encode('{"bad": true}')),
        ),
      ]);
      return BackupBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const BackupEvent.restoreRequested()),
    expect: () => const [
      BackupState.processing(operation: BackupOperation.restore),
      BackupState.failure(message: 'JSON must be a list of words'),
    ],
  );

  blocTest<BackupBloc, BackupState>(
    'exportRequested handles platform exception',
    build: () {
      when(
        () => appDatabase.getAllWordsWithTopicName(),
      ).thenAnswer((_) async => []);
      fakePicker.saveFileError = PlatformException(
        code: 'x',
        message: 'denied',
      );
      return BackupBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const BackupEvent.exportRequested()),
    expect: () => const [
      BackupState.processing(operation: BackupOperation.export),
      BackupState.failure(message: 'Ошибка доступа к файлам: denied'),
    ],
  );

  blocTest<BackupBloc, BackupState>(
    'generic export failure emits fallback message',
    build: () {
      when(
        () => appDatabase.getAllWordsWithTopicName(),
      ).thenThrow(Exception('db'));
      return BackupBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const BackupEvent.exportRequested()),
    expect: () => const [
      BackupState.processing(operation: BackupOperation.export),
      BackupState.failure(message: 'Не удалось создать резервную копию'),
    ],
  );

  blocTest<BackupBloc, BackupState>(
    'statusConsumed resets to idle',
    build: () => BackupBloc(appDatabase: appDatabase),
    seed: () => const BackupState.failure(message: 'err'),
    act: (bloc) => bloc.add(const BackupEvent.statusConsumed()),
    expect: () => const [BackupState.idle()],
  );
}
