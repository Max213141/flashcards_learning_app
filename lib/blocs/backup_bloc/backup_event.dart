part of 'backup_bloc.dart';

@freezed
class BackupEvent with _$BackupEvent {
  const factory BackupEvent.exportRequested() = _ExportRequested;
  const factory BackupEvent.restoreRequested() = _RestoreRequested;
  const factory BackupEvent.statusConsumed() = _StatusConsumed;
}
