import 'package:article_browser/domain/models/article/article.dart';
import 'package:article_browser/domain/models/reception_details/reception_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_previews.freezed.dart';
part 'article_previews.g.dart';

@freezed
abstract class ArticlePreviews with _$ArticlePreviews {
  const ArticlePreviews._();

  const factory ArticlePreviews({
    required ReceptionDetails receptionDetails,
    required List<Article> data,
  }) = _ArticlePreviews;

  factory ArticlePreviews.fromJson(Map<String, Object?> json) =>
      _$ArticlePreviewsFromJson(json);

  ArticlePreviews asCached() {
    return copyWith(receptionDetails: receptionDetails.asCached());
  }
}
