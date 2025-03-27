import 'package:article_browser/domain/models/article_details/article_details.dart';

abstract class ArticleDetailsRepository {
  Future<ArticleDetails> fetchDetails(int articleId);

  Future<void> saveDetailsToCache(ArticleDetails articleDetails);

  Future<ArticleDetails?> loadCachedDetails(int articleId);
}
