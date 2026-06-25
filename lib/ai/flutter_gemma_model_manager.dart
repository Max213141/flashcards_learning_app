import 'dart:io';

import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_model_manager.dart';
import 'package:flashcards_learning_app/core/local_ai_model_config.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class FlutterGemmaModelManager implements LocalAiModelManager {
  CancelToken? _cancelToken;

  @override
  Future<bool> isInstalled() async {
    if (await FlutterGemma.isModelInstalled(LocalAiModelConfig.fileName)) {
      return true;
    }

    return (await _localModelFile()).exists();
  }

  @override
  Future<void> install({
    required void Function(int progress) onProgress,
  }) async {
    final token = CancelToken();
    _cancelToken = token;
    try {
      final modelFile = await _downloadModel(
        onProgress: onProgress,
        cancelToken: token,
      );
      await _fileInstallationBuilder(modelFile.path).install();
    } finally {
      if (identical(_cancelToken, token)) {
        _cancelToken = null;
      }
    }
  }

  @override
  Future<void> activateInstalledModel() async {
    final modelFile = await _localModelFile();
    await _fileInstallationBuilder(modelFile.path).install();
  }

  @override
  Future<void> cleanupIncompleteInstall() async {
    try {
      if (await isInstalled()) {
        return;
      }

      final tempFile = await _temporaryModelFile();
      if (await tempFile.exists()) {
        await tempFile.delete();
      }

      final modelManager = FlutterGemmaPlugin.instance.modelManager;
      await modelManager.cleanupStorage();
      await modelManager.deleteModel(_modelSpec());
    } catch (_) {
      // Cleanup is best-effort; a cleanup failure should not block a retry.
    }
  }

  @override
  void cancelInstall() {
    _cancelToken?.cancel('User cancelled local AI model download');
  }

  InferenceInstallationBuilder _fileInstallationBuilder(String path) {
    return FlutterGemma.installModel(
      modelType: LocalAiModelConfig.modelType,
      fileType: LocalAiModelConfig.fileType,
    ).fromFile(path);
  }

  InferenceModelSpec _modelSpec() {
    return InferenceModelSpec.fromLegacyUrl(
      name: LocalAiModelConfig.fileName,
      modelUrl: LocalAiModelConfig.downloadUrl,
      modelType: LocalAiModelConfig.modelType,
      fileType: LocalAiModelConfig.fileType,
    );
  }

  Future<File> _downloadModel({
    required void Function(int progress) onProgress,
    required CancelToken cancelToken,
  }) async {
    final targetFile = await _localModelFile();
    final tempFile = await _temporaryModelFile();
    final client = HttpClient();
    cancelToken.whenCancelled.then((_) => client.close(force: true));

    try {
      if (await tempFile.exists()) {
        await tempFile.delete();
      }

      final request = await client.getUrl(
        Uri.parse(LocalAiModelConfig.downloadUrl),
      );
      final response = await request.close();

      if (response.statusCode < HttpStatus.ok ||
          response.statusCode >= HttpStatus.multipleChoices) {
        throw HttpException(
          'Failed to download model: HTTP ${response.statusCode}',
          uri: Uri.parse(LocalAiModelConfig.downloadUrl),
        );
      }

      final totalBytes = response.contentLength;
      var receivedBytes = 0;
      var lastProgress = 0;
      final sink = tempFile.openWrite();

      try {
        await for (final chunk in response) {
          cancelToken.throwIfCancelled();
          receivedBytes += chunk.length;
          sink.add(chunk);

          if (totalBytes > 0) {
            final progress = ((receivedBytes * 100) ~/ totalBytes).clamp(0, 99);
            if (progress > lastProgress) {
              lastProgress = progress;
              onProgress(progress);
            }
          }
        }
      } finally {
        await sink.close();
      }

      cancelToken.throwIfCancelled();

      if (await targetFile.exists()) {
        await targetFile.delete();
      }
      await tempFile.rename(targetFile.path);
      onProgress(100);

      return targetFile;
    } catch (_) {
      if (await tempFile.exists()) {
        await tempFile.delete();
      }
      cancelToken.throwIfCancelled();
      rethrow;
    } finally {
      client.close(force: true);
    }
  }

  Future<File> _localModelFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File(p.join(directory.path, LocalAiModelConfig.fileName));
  }

  Future<File> _temporaryModelFile() async {
    final modelFile = await _localModelFile();
    return File('${modelFile.path}.download');
  }
}
