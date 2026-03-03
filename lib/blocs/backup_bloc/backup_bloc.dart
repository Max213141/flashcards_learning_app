import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/utils/picker_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_event.dart';
part 'backup_state.dart';
part 'backup_bloc.freezed.dart';

class BackupBloc extends Bloc<BackupEvent, BackupState> {
  BackupBloc({required this.appDatabase}) : super(const BackupState.idle()) {
    on<_ExportRequested>(_onExportRequested);
    on<_RestoreRequested>(_onRestoreRequested);
    on<_StatusConsumed>(_onStatusConsumed);
  }

  final AppDatabase appDatabase;

  Future<void> _onExportRequested(
    _ExportRequested event,
    Emitter<BackupState> emit,
  ) async {
    emit(const BackupState.processing(operation: BackupOperation.export));

    try {
      final words = await appDatabase.getAllWordsWithTopicName();
      final jsonList = words.map(_wordToBackupJson).toList();
      final jsonString = const JsonEncoder.withIndent('  ').convert(jsonList);

      final fileName =
          'flashcards_backup_${DateTime.now().toIso8601String().replaceAll(':', '-')}.json';
      final path = await FilePicker.platform.saveFile(
        dialogTitle: 'Сохранить резервную копию',
        fileName: fileName,
        type: FileType.custom,
        bytes: utf8.encode(jsonString),
        allowedExtensions: const ['json'],
      );

      if (path == null) {
        emit(const BackupState.idle());
        return;
      }

      final filePath = path.endsWith('.json') ? path : '$path.json';
      await File(filePath).writeAsString(jsonString);
      emit(
        const BackupState.exportSuccess(message: 'Резервная копия сохранена'),
      );
    } on PlatformException catch (e) {
      emit(
        BackupState.failure(
          message: 'Ошибка доступа к файлам: ${e.message}',
        ),
      );
    } catch (_) {
      emit(
        const BackupState.failure(
          message: 'Не удалось создать резервную копию',
        ),
      );
    }
  }

  Future<void> _onRestoreRequested(
    _RestoreRequested event,
    Emitter<BackupState> emit,
  ) async {
    emit(const BackupState.processing(operation: BackupOperation.restore));

    try {
      final pickedData = await PickerUtil().pickJson();
      if (pickedData == null) {
        emit(const BackupState.idle());
        return;
      }

      final backupJson = _normalizeBackupJson(pickedData);
      final restoredWordsCount = await appDatabase.restoreFromBackupJson(
        backupJson,
      );

      emit(
        BackupState.restoreSuccess(
          restoredWordsCount: restoredWordsCount,
          message: 'Восстановлено слов: $restoredWordsCount',
        ),
      );
    } on PlatformException catch (e) {
      emit(
        BackupState.failure(
          message: 'Ошибка доступа к файлам: ${e.message}',
        ),
      );
    } on FormatException catch (e) {
      emit(BackupState.failure(message: e.message));
    } catch (_) {
      emit(
        const BackupState.failure(
          message: 'Не удалось восстановить резервную копию',
        ),
      );
    }
  }

  void _onStatusConsumed(_StatusConsumed event, Emitter<BackupState> emit) {
    emit(const BackupState.idle());
  }

  List<Map<String, dynamic>> _normalizeBackupJson(dynamic pickedData) {
    if (pickedData is! List) {
      throw const FormatException('JSON must be a list of words');
    }

    return pickedData.map<Map<String, dynamic>>((item) {
      if (item is! Map) {
        throw const FormatException(
          'Each JSON item must be an object with word data',
        );
      }
      return item.map((key, value) => MapEntry(key.toString(), value));
    }).toList();
  }

  Map<String, dynamic> _wordToBackupJson(Word word) {
    final json = <String, dynamic>{
      'word': word.word.trim(),
      'translation': word.translation.trim(),
      'learned': word.learned,
      if (word.learnedAt != null) 'learnedAt': word.learnedAt!.toIso8601String(),
    };

    void addIfNotEmpty(String key, String? value) {
      final trimmed = value?.trim();
      if (trimmed == null || trimmed.isEmpty) return;
      json[key] = trimmed;
    }

    addIfNotEmpty('topic', word.topic);
    addIfNotEmpty('transcription', word.transcription);
    addIfNotEmpty('partOfSpeech', word.partOfSpeech);
    addIfNotEmpty('usage', word.usage);

    return json;
  }
}
