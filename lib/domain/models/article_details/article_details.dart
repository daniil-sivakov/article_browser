import 'package:article_browser/domain/models/article/article.dart';
import 'package:article_browser/domain/models/comment/comment.dart';
import 'package:article_browser/domain/models/reception_details/reception_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_details.freezed.dart';
part 'article_details.g.dart';

@freezed
abstract class ArticleDetails with _$ArticleDetails {
  const ArticleDetails._();

  const factory ArticleDetails({
    required ReceptionDetails receptionDetails,
    required Article article,
    required List<Comment> comments,
  }) = _ArticleDetails;

  factory ArticleDetails.fromJson(Map<String, Object?> json) =>
      _$ArticleDetailsFromJson(json);

  // Рецензенту: внешние пользователи объекта (use cases) могли бы использовать:
  //
  // final cachedDetails = details.copyWith(
  //   receptionDetails: details.receptionDetails.copyWith(
  //      dataSource: DataSource.localCache,
  //   ),
  // );
  //
  // Это не требовало бы отдельных методов внутри классов, но выглядело бы
  // более объёмно внутри содержимого сценария использования и нарушало бы
  // закон Деметры. К тому же, при условии наличия инвариантов для классов
  // ArticleDetails, ArticlePreviews, ReceptionDetails соблюдение этих инвариантов
  // будет удобно поддерживать в подобных методах:
  //
  // ReceptionDetails asCached() {
  //   if (this.dataReceivedAt == null) {
  //      throw StateError('ReceptionDetails cannot be cached without reception date');
  //   }
  //   return copyWith(dataSource: DataSource.cache);
  // }

  ArticleDetails asCached() {
    return copyWith(receptionDetails: receptionDetails.asCached());
  }

  // Для удобства Unit-тестирования
  int getArticleId() => article.id;
}
