abstract class LocalStorageProvider {
  Future<void> set({required String key, required String value});

  Future<String?> get(String key);

  Future<void> remove(String key);

  Future<void> removeAll();
}
