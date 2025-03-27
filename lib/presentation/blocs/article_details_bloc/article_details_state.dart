import 'package:article_browser/domain/models/article/article.dart';
import 'package:article_browser/domain/models/comment/comment.dart';
import 'package:article_browser/presentation/messages/data_processing_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_details_state.freezed.dart';

@freezed
sealed class ArticleDetailsState with _$ArticleDetailsState {
  const factory ArticleDetailsState._idle({
    required Article? article,
    required List<Comment> comments,
    required bool noDataFound,
  }) = IdleArticleDetailsState;

  const factory ArticleDetailsState._processing({
    required Article? article,
    required List<Comment> comments,
    required bool noDataFound,
  }) = ProcessingArticleDetailsState;

  const factory ArticleDetailsState._notification({
    required Article? article,
    required List<Comment> comments,
    required bool noDataFound,
    required DataProcessingMessage message,
  }) = NotificationArticleDetailsState;

  static ArticleDetailsState initial() => const ArticleDetailsState._idle(
    article: null,
    comments: [],
    noDataFound: false,
  );
}

extension AvailableStatesExtension on ArticleDetailsState {
  ArticleDetailsState idle() {
    return ArticleDetailsState._idle(
      article: article,
      comments: comments,
      noDataFound: noDataFound,
    );
  }

  ArticleDetailsState newData(Article article, List<Comment> comments) {
    return copyWith(article: article, comments: comments, noDataFound: false);
  }

  ArticleDetailsState dataNotFound() {
    return copyWith(noDataFound: true);
  }

  ArticleDetailsState processing() {
    return ArticleDetailsState._processing(
      article: article,
      comments: comments,
      noDataFound: noDataFound,
    );
  }

  ArticleDetailsState notification(DataProcessingMessage message) {
    return ArticleDetailsState._notification(
      article: article,
      comments: comments,
      noDataFound: noDataFound,
      message: message,
    );
  }
}
