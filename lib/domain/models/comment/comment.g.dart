// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Comment _$CommentFromJson(Map<String, dynamic> json) => _Comment(
  postId: (json['postId'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  body: json['body'] as String,
);

Map<String, dynamic> _$CommentToJson(_Comment instance) => <String, dynamic>{
  'postId': instance.postId,
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'body': instance.body,
};
