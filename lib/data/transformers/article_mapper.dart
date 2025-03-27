import 'package:article_browser/data/models/article_data/article_data.dart';
import 'package:article_browser/domain/models/article/article.dart';

class ArticleMapper {
  List<Article> toDomainModelList(List<ArticleData> articlesData) {
    return articlesData.map(toDomainModel).toList();
  }

  Article toDomainModel(ArticleData articleData) {
    return Article(
      id: articleData.id,
      userId: articleData.userId,
      title: articleData.title,
      body: articleData.body,
    );
  }
}
