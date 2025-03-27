import 'package:article_browser/domain/models/article_previews/article_previews.dart';

abstract class ArticlePreviewsRepository {
  Future<ArticlePreviews> fetchPreviews();

  Future<void> savePreviewsToCache(ArticlePreviews articlePreviews);

  Future<ArticlePreviews?> loadCachedPreviews();
}
