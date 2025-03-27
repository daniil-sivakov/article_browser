import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_data.freezed.dart';
part 'article_data.g.dart';

@freezed
abstract class ArticleData with _$ArticleData {
  const factory ArticleData({
    required int id,
    required int userId,
    required String title,
    required String body,
  }) = _ArticleData;

  factory ArticleData.fromJson(Map<String, Object?> json) =>
      _$ArticleDataFromJson(json);
}
