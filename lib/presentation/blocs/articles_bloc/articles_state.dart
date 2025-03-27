import 'package:article_browser/domain/models/article/article.dart';
import 'package:article_browser/presentation/messages/data_processing_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_state.freezed.dart';

@freezed
sealed class ArticlesState with _$ArticlesState {
  const factory ArticlesState._idle({
    required List<Article> data,
    required DateTime? lastRetrievedTime,
    required DateTime? shownLastRetrievedTime,
  }) = IdleArticlesState;

  const factory ArticlesState._processing({
    required List<Article> data,
    required DateTime? lastRetrievedTime,
    required DateTime? shownLastRetrievedTime,
  }) = ProcessingArticlesState;

  const factory ArticlesState._notification({
    required List<Article> data,
    required DateTime? lastRetrievedTime,
    required DateTime? shownLastRetrievedTime,
    required DataProcessingMessage message,
  }) = NotificationArticlesState;

  static ArticlesState initial() => const ArticlesState._idle(
    data: [],
    lastRetrievedTime: null,
    shownLastRetrievedTime: null,
  );
}

extension AvailableStatesExtension on ArticlesState {
  ArticlesState idle() {
    return ArticlesState._idle(
      data: data,
      lastRetrievedTime: lastRetrievedTime,
      shownLastRetrievedTime: shownLastRetrievedTime,
    );
  }

  ArticlesState newData(List<Article> data, DateTime lastRetrievedTime) {
    return copyWith(
      data: data,
      lastRetrievedTime: lastRetrievedTime,
      shownLastRetrievedTime: shownLastRetrievedTime,
    );
  }

  ArticlesState processing() {
    return ArticlesState._processing(
      data: data,
      lastRetrievedTime: lastRetrievedTime,
      shownLastRetrievedTime: shownLastRetrievedTime,
    );
  }

  ArticlesState notification(DataProcessingMessage message) {
    return ArticlesState._notification(
      data: data,
      lastRetrievedTime: lastRetrievedTime,
      shownLastRetrievedTime: shownLastRetrievedTime,
      message: message,
    );
  }
}
