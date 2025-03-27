// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentData _$CommentDataFromJson(Map<String, dynamic> json) => _CommentData(
  postId: (json['postId'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  body: json['body'] as String,
);

Map<String, dynamic> _$CommentDataToJson(_CommentData instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
