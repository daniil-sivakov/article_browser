// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArticleDetails _$ArticleDetailsFromJson(Map<String, dynamic> json) =>
    _ArticleDetails(
      receptionDetails: ReceptionDetails.fromJson(
        json['receptionDetails'] as Map<String, dynamic>,
      ),
      article: Article.fromJson(json['article'] as Map<String, dynamic>),
      comments:
          (json['comments'] as List<dynamic>)
              .map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ArticleDetailsToJson(_ArticleDetails instance) =>
    <String, dynamic>{
      'receptionDetails': instance.receptionDetails.toJson(),
      'article': instance.article.toJson(),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };
