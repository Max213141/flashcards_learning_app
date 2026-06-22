abstract interface class LocalAiModelManager {
  Future<bool> isInstalled();

  Future<void> install({required void Function(int progress) onProgress});

  Future<void> activateInstalledModel();

  Future<void> cleanupIncompleteInstall();

  void cancelInstall();
}
