import 'package:article_browser/data/api/api_client.dart';
import 'package:article_browser/data/constants/local_storage_keys.dart';
import 'package:article_browser/data/codecs/article_previews_codec.dart';
import 'package:article_browser/data/factories/article_previews_factory.dart';
import 'package:article_browser/data/factories/domain_exception_factory.dart';
import 'package:article_browser/data/models/article_data/article_data.dart';
import 'package:article_browser/data/providers/local_storage_provider.dart';
import 'package:article_browser/domain/models/article_previews/article_previews.dart';
import 'package:article_browser/domain/repositories/article_previews_repository.dart';
import 'package:dio/dio.dart';

class ArticlePreviewsRepositoryImpl implements ArticlePreviewsRepository {
  const ArticlePreviewsRepositoryImpl(
    this._apiClient,
    this._localStorageProvider, [
    this._articlePreviewsFactory = const ArticlePreviewsFactory(),
    this._articlePreviewsCodec = const ArticlePreviewsCodec(),
  ]);

  final ApiClient _apiClient;
  final LocalStorageProvider _localStorageProvider;
  final ArticlePreviewsFactory _articlePreviewsFactory;
  final ArticlePreviewsCodec _articlePreviewsCodec;

  @override
  Future<ArticlePreviews> fetchPreviews() async {
    try {
      final List<ArticleData> articlesData = await _apiClient.fetchArticles();

      return _articlePreviewsFactory.createNetworkPreviews(articlesData);
    } on DioException catch (exception) {
      throw DomainExceptionFactory().createDomainException(exception);
    }
  }

  @override
  Future<ArticlePreviews?> loadCachedPreviews() async {
    final String storageKey = _getLocalStorageKey();
    final previewsJsonString = await _localStorageProvider.get(storageKey);

    if (previewsJsonString == null) return null;

    try {
      return _articlePreviewsCodec.decodePreviewsFromJson(previewsJsonString);
    } on Object {
      _localStorageProvider.remove(storageKey);
      rethrow;
    }
  }

  @override
  Future<void> savePreviewsToCache(ArticlePreviews articlePreviews) {
    return _localStorageProvider.set(
      key: _getLocalStorageKey(),
      value: _articlePreviewsCodec.encodeToJsonString(articlePreviews),
    );
  }

  String _getLocalStorageKey() => LocalStorageKeys.articlePreviews;
}
