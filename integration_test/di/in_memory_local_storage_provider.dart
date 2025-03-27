import 'package:article_browser/data/providers/local_storage_provider.dart';

class InMemoryLocalStorageProvider extends LocalStorageProvider {
  final Map<String, String> _storage = {};

  @override
  Future<String?> get(String key) async {
    return _storage[key];
  }

  @override
  Future<void> set({required String key, required String value}) async {
    _storage[key] = value;
  }

  @override
  Future<void> remove(String key) async {
    _storage.remove(key);
  }

  @override
  Future<void> removeAll() async {
    _storage.clear();
  }
}
