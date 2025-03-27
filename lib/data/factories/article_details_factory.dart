import 'package:article_browser/data/mappers/article_mapper.dart';
import 'package:article_browser/data/mappers/comment_mapper.dart';
import 'package:article_browser/data/models/article_data/article_data.dart';
import 'package:article_browser/data/models/comment_data/comment_data.dart';
import 'package:article_browser/domain/models/article_details/article_details.dart';
import 'package:article_browser/domain/models/data_source/data_source.dart';
import 'package:article_browser/domain/models/reception_details/reception_details.dart';

class ArticleDetailsFactory {
  const ArticleDetailsFactory();

  ArticleDetails createNetworkDetails(
    ArticleData articleData,
    List<CommentData> commentsData,
  ) {
    return ArticleDetails(
      article: ArticleMapper().toDomainModel(articleData),
      comments: CommentMapper().toDomainModelList(commentsData),
      receptionDetails: ReceptionDetails(
        dataReceivedAt: DateTime.now(),
        dataSource: DataSource.network,
      ),
    );
  }
}
