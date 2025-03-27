import 'package:article_browser/domain/models/comment/comment.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(comment.email), subtitle: Text(comment.body));
  }
}
