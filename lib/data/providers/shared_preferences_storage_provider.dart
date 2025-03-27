import 'package:shared_preferences/shared_preferences.dart';
import 'package:article_browser/data/providers/local_storage_provider.dart';

// Рецензенту: я выбрал именно key/value для контракта и SharedPreferences
// для реализации локальных хранилищ, так как такой подход вижу самым простым и легковесным.
//
// Факторы для использования более комплексных решений (drift/sqlite):
//
// - Работа с большими объёмами данных и их типов
//   для нас неактуально: максимум в приложении - 100 статей ~ 7.9 кБ по запросу /posts/
// - Высокие требования к производительности, наличие данных в бинарном формате, использование изолят
//   для нас неактуально из-за небольших объёмов данных, при необходимости можно
//   использовать Stream вместо Future, если Event Loop при каком-то условии забьётся
// - Локальность данных, требования к стабильности, соответствующая необходимость в миграциях
//   для нас неактуально, данные перезатираются после каждого обращения к серверу,
//   если и потеряются, то не страшно
// - Наличие сложных связей между элементами и сопутствующая нужда в транзакциях
//   для нас неактуально, одна связь между комментариями и статьями

class SharedPreferencesStorageProvider implements LocalStorageProvider {
  @override
  Future<void> set({required String key, required String value}) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  @override
  Future<String?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future<void> removeAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
