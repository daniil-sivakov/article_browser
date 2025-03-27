import 'package:article_browser/data/models/comment_data/comment_data.dart';
import 'package:article_browser/domain/models/comment/comment.dart';

class CommentMapper {
  List<Comment> toDomainModelList(List<CommentData> commentsData) {
    return commentsData.map(toDomainModel).toList();
  }

  Comment toDomainModel(CommentData commentData) {
    return Comment(
      id: commentData.id,
      postId: commentData.postId,
      email: commentData.email,
      name: commentData.name,
      body: commentData.body,
    );
  }
}
