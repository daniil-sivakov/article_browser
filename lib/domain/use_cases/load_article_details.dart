import 'dart:async';

import 'package:article_browser/core/services/network_connection_service.dart';
import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:article_browser/domain/models/article_details.dart';
import 'package:article_browser/domain/repositories/article_details_repository.dart';

class LoadArticleDetails {
  const LoadArticleDetails(this._repository, this._networkConnectionService);

  final ArticleDetailsRepository _repository;
  final NetworkConnectionService _networkConnectionService;

  // Рецензенту: Если что-то пойдёт не так при сохранении данных после их загрузки,
  // проблемы не должны мешать вернуть результат успешной операции.
  // Чтобы сохранить компактность и не добавлять дополнительные модели в
  // предметную область, учитывающие наличие или отсутствие ошибок,
  // буду использовать Stream вместо Future.
  Stream<ArticleDetails> execute(int articleId) async* {
    // Рецензенту: проще было бы грузить с локального хранилища, если запрос
    // к сети по любой причине не доходит (обернуть в try-catch), но в требованиях
    // указано именно "Если нет интернета".
    final NetworkConnectionState connection =
        await _networkConnectionService.checkConnection();

    if (connection == NetworkConnectionState.hasConnection) {
      final ArticleDetails details = await _repository.fetchDetails(articleId);

      yield details;

      await _repository.saveDetailsToCache(details);

      return;
    }

    if (connection == NetworkConnectionState.noConnection) {
      final ArticleDetails? cachedDetails = await _repository.loadCachedDetails(
        articleId,
      );
      if (cachedDetails == null) throw NoDataInCacheException();

      yield cachedDetails.asCached();

      return;
    }

    throw StateError('Unexpected connection state: $connection');
  }
}
