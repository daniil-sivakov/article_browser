import 'package:article_browser/data/models/article_data/article_data.dart';
import 'package:article_browser/data/mappers/article_mapper.dart';
import 'package:article_browser/domain/models/article_previews/article_previews.dart';
import 'package:article_browser/domain/models/data_source/data_source.dart';
import 'package:article_browser/domain/models/reception_details/reception_details.dart';

class ArticlePreviewsFactory {
  const ArticlePreviewsFactory();

  ArticlePreviews createNetworkPreviews(List<ArticleData> articlesData) {
    return ArticlePreviews(
      receptionDetails: ReceptionDetails(
        dataReceivedAt: DateTime.now(),
        dataSource: DataSource.network,
      ),
      data: ArticleMapper().toDomainModelList(articlesData),
    );
  }
}
