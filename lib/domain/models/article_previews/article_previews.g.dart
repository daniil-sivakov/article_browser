// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_previews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArticlePreviews _$ArticlePreviewsFromJson(Map<String, dynamic> json) =>
    _ArticlePreviews(
      receptionDetails: ReceptionDetails.fromJson(
        json['receptionDetails'] as Map<String, dynamic>,
      ),
      data:
          (json['data'] as List<dynamic>)
              .map((e) => Article.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ArticlePreviewsToJson(_ArticlePreviews instance) =>
    <String, dynamic>{
      'receptionDetails': instance.receptionDetails.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
