// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArticleData _$ArticleDataFromJson(Map<String, dynamic> json) => _ArticleData(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  title: json['title'] as String,
  body: json['body'] as String,
);

Map<String, dynamic> _$ArticleDataToJson(_ArticleData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
    };
