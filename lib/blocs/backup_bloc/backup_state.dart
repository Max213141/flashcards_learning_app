part of 'backup_bloc.dart';

@freezed
class BackupState with _$BackupState {
  const factory BackupState.idle() = _Idle;

  const factory BackupState.processing({required BackupOperation operation}) =
      _Processing;

  const factory BackupState.exportSuccess({required String message}) =
      _ExportSuccess;

  const factory BackupState.restoreSuccess({
    required int restoredWordsCount,
    required String message,
  }) = _RestoreSuccess;

  const factory BackupState.failure({required String message}) = _Failure;
}

enum BackupOperation { export, restore }
