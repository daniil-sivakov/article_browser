import 'package:article_browser/data/api/api_client.dart';
import 'package:article_browser/data/constants/local_storage_keys.dart';
import 'package:article_browser/data/factories/article_details_factory.dart';
import 'package:article_browser/data/codecs/article_details_codec.dart';
import 'package:article_browser/data/factories/domain_exception_factory.dart';
import 'package:article_browser/data/providers/local_storage_provider.dart';
import 'package:article_browser/domain/models/article_details/article_details.dart';
import 'package:article_browser/domain/repositories/article_details_repository.dart';
import 'package:dio/dio.dart';

class ArticleDetailsRepositoryImpl implements ArticleDetailsRepository {
  const ArticleDetailsRepositoryImpl(
    this._apiClient,
    this._localStorageProvider, [
    this._articleDetailsFactory = const ArticleDetailsFactory(),
    this._articleDetailsCodec = const ArticleDetailsCodec(),
  ]);

  final ApiClient _apiClient;
  final LocalStorageProvider _localStorageProvider;
  final ArticleDetailsFactory _articleDetailsFactory;
  final ArticleDetailsCodec _articleDetailsCodec;

  @override
  Future<ArticleDetails> fetchDetails(int articleId) async {
    try {
      final (articleData, commentsData) = (
        await _apiClient.fetchArticleDetails(articleId),
        await _apiClient.fetchComments(articleId),
      );

      return _articleDetailsFactory.createNetworkDetails(
        articleData,
        commentsData,
      );
    } on DioException catch (exception) {
      throw DomainExceptionFactory().createDomainException(exception);
    }
  }

  @override
  Future<ArticleDetails?> loadCachedDetails(int articleId) async {
    final String storageKey = _getLocalStorageKeyForArticle(articleId);
    final detailsJsonString = await _localStorageProvider.get(storageKey);

    if (detailsJsonString == null) return null;

    try {
      return _articleDetailsCodec.decodeDetailsFromJson(detailsJsonString);
    } on Object {
      _localStorageProvider.remove(storageKey);
      rethrow;
    }
  }

  @override
  Future<void> saveDetailsToCache(ArticleDetails articleDetails) {
    return _localStorageProvider.set(
      key: _getLocalStorageKeyForArticle(articleDetails.getArticleId()),
      value: _articleDetailsCodec.encodeToJsonString(articleDetails),
    );
  }

  String _getLocalStorageKeyForArticle(int articleId) =>
      '${LocalStorageKeys.articleDetailsBase}_$articleId';
}
