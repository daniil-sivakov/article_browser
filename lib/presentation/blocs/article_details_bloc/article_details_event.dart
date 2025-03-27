part of 'article_details_bloc.dart';

sealed class ArticleDetailsEvent {
  factory ArticleDetailsEvent.dataUpdateRequested() = _DataUpdateRequested;
}

class _DataUpdateRequested implements ArticleDetailsEvent {}
