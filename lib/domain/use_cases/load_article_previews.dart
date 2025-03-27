import 'dart:async';

import 'package:article_browser/core/core.dart';
import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:article_browser/domain/models/article_previews/article_previews.dart';
import 'package:article_browser/domain/repositories/article_previews_repository.dart';

// Рецензенту:
// В сообществе много мнений по поводу, что такое Use case/Interactor и как их использовать.
// Поэтому я вижу необходимым прояснить детали реализации.
// Я выбрал подход "вариантов использования" по "Чистой архитектуре" Роберта Мартина.
// Сам Мартин предпочитает называть эти объекты "Interactors".
// В Flutter-среде более распространено название "Use case", буду использовать его.

class LoadArticlePreviews {
  const LoadArticlePreviews(this._repository, this._networkConnectionService);

  final ArticlePreviewsRepository _repository;
  final NetworkConnectionService _networkConnectionService;

  // Рецензенту: Если что-то пойдёт не так при сохранении данных после их загрузки,
  // проблемы не должны мешать вернуть результат успешной операции.
  // Чтобы сохранить компактность и не добавлять дополнительные модели в
  // предметную область, учитывающие наличие или отсутствие ошибок,
  // буду использовать Stream вместо Future.
  Stream<ArticlePreviews> execute() async* {
    final NetworkConnectionState connection =
        await _networkConnectionService.checkConnection();

    if (connection == NetworkConnectionState.hasConnection) {
      final ArticlePreviews previews = await _repository.fetchPreviews();

      yield previews;

      await _repository.savePreviewsToCache(previews);

      return;
    }

    if (connection == NetworkConnectionState.noConnection) {
      final ArticlePreviews? cachedPreviews =
          await _repository.loadCachedPreviews();

      if (cachedPreviews == null) throw NoDataInCacheException();

      yield cachedPreviews.asCached();

      return;
    }

    throw StateError('Unexpected connection state: $connection');
  }
}
