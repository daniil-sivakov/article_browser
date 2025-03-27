import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_data.freezed.dart';
part 'comment_data.g.dart';

@freezed
abstract class CommentData with _$CommentData {
  const factory CommentData({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) = _CommentData;

  factory CommentData.fromJson(Map<String, Object?> json) =>
      _$CommentDataFromJson(json);
}
