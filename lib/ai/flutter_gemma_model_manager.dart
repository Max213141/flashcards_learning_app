import 'package:background_downloader/background_downloader.dart';
import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_model_manager.dart';
import 'package:flashcards_learning_app/core/local_ai_model_config.dart';
import 'package:flutter_gemma/flutter_gemma.dart';

class FlutterGemmaModelManager implements LocalAiModelManager {
  CancelToken? _cancelToken;

  @override
  Future<bool> isInstalled() {
    return FlutterGemma.isModelInstalled(LocalAiModelConfig.fileName);
  }

  @override
  Future<void> install({
    required void Function(int progress) onProgress,
  }) async {
    await _prepareForegroundDownload();
    final token = CancelToken();
    _cancelToken = token;
    try {
      await _installationBuilder()
          .withProgress(onProgress)
          .withCancelToken(token)
          .install();
    } finally {
      if (identical(_cancelToken, token)) {
        _cancelToken = null;
      }
    }
  }

  @override
  Future<void> activateInstalledModel() async {
    _configureDownloadNotification();
    await _installationBuilder().install();
  }

  @override
  void cancelInstall() {
    _cancelToken?.cancel('User cancelled local AI model download');
  }

  InferenceInstallationBuilder _installationBuilder() {
    return FlutterGemma.installModel(
      modelType: LocalAiModelConfig.modelType,
      fileType: LocalAiModelConfig.fileType,
    ).fromNetwork(LocalAiModelConfig.downloadUrl, foreground: true);
  }

  Future<void> _prepareForegroundDownload() async {
    _configureDownloadNotification();

    final downloader = FileDownloader();
    final status = await downloader.permissions.status(
      PermissionType.notifications,
    );
    if (status == PermissionStatus.granted) {
      return;
    }

    await downloader.permissions.request(PermissionType.notifications);
  }

  void _configureDownloadNotification() {
    FileDownloader().configureNotification(
      running: const TaskNotification(
        'Downloading AI model',
        '${LocalAiModelConfig.displayName}: {progress}',
      ),
      error: const TaskNotification(
        'AI model download failed',
        'Open the app to retry',
      ),
      canceled: const TaskNotification(
        'AI model download canceled',
        'Open the app to retry',
      ),
      progressBar: true,
    );
  }
}
