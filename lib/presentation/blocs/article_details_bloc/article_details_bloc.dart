import 'dart:async';

import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:article_browser/domain/models/article/article.dart';
import 'package:article_browser/domain/models/comment/comment.dart';
import 'package:article_browser/domain/models/data_source/data_source.dart';
import 'package:article_browser/domain/models/reception_details/reception_details.dart';
import 'package:article_browser/domain/use_cases/load_article_details.dart';
import 'package:article_browser/presentation/blocs/article_details_bloc/article_details_state.dart';
import 'package:article_browser/presentation/messages/data_processing_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'article_details_event.dart';

class ArticleDetailsBloc
    extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  ArticleDetailsBloc(this._articleId, this._loadArticleDetails)
    : super(ArticleDetailsState.initial()) {
    on<_DataUpdateRequested>(
      _performDataUpdate,
      transformer: bloc_concurrency.droppable(),
    );
  }

  final int _articleId;
  final LoadArticleDetails _loadArticleDetails;

  Future<void> _performDataUpdate(
    _DataUpdateRequested _,
    Emitter<ArticleDetailsState> emit,
  ) async {
    try {
      emit(state.processing());
      await for (final articleDetails in _loadArticleDetails.execute(
        _articleId,
      )) {
        final ReceptionDetails details = articleDetails.receptionDetails;
        final Article article = articleDetails.article;
        final List<Comment> comments = articleDetails.comments;

        emit(state.newData(article, comments));

        final DataProcessingMessage message = switch (details.dataSource) {
          DataSource.network => DataProcessingMessage.fetchedFromNetwork,
          DataSource.cache => DataProcessingMessage.loadedFromCache,
        };
        emit(state.notification(message));
      }
    } on NoDataFoundException {
      emit(state.notification(DataProcessingMessage.errorNoDataFound));
      emit(state.dataNotFound());
    } on NoDataInCacheException {
      emit(state.notification(DataProcessingMessage.noDataInLocalCache));
      emit(state.dataNotFound());
    } on RemoteHostNotReachedException {
      emit(state.notification(DataProcessingMessage.errorNoInternet));
    } on Object catch (_) {
      emit(state.notification(DataProcessingMessage.unknownError));
      rethrow;
    } finally {
      emit(state.idle());
    }
  }
}
