import 'dart:async';

import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:article_browser/domain/models/article/article.dart';
import 'package:article_browser/domain/models/data_source/data_source.dart';
import 'package:article_browser/domain/models/reception_details/reception_details.dart';
import 'package:article_browser/domain/use_cases/load_article_previews.dart';
import 'package:article_browser/presentation/blocs/articles_bloc/articles_state.dart';
import 'package:article_browser/presentation/messages/data_processing_message.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'articles_event.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc(
    this._loadArticlePreviews, [
    this._dateVisibilityCheckPeriod = const Duration(minutes: 1),
  ]) : super(ArticlesState.initial()) {
    on<_DataUpdateRequested>(
      _performDataUpdate,
      transformer: bloc_concurrency.droppable(),
    );
    on<_RetrievalDateVisibilityCheckRequested>(
      _checkRetrievalDateVisibility,
      transformer: bloc_concurrency.sequential(),
    );

    _timer = Timer.periodic(_dateVisibilityCheckPeriod, (_) {
      add(_RetrievalDateVisibilityCheckRequested());
    });
  }

  final Duration _dateVisibilityCheckPeriod;
  final LoadArticlePreviews _loadArticlePreviews;
  late final Timer _timer;

  Future<void> _performDataUpdate(
    _DataUpdateRequested _,
    Emitter<ArticlesState> emit,
  ) async {
    try {
      emit(state.processing());
      await for (final previews in _loadArticlePreviews.execute()) {
        final ReceptionDetails details = previews.receptionDetails;
        final List<Article> data = previews.data;

        emit(state.newData(data, details.dataReceivedAt));

        final DataProcessingMessage message = switch (details.dataSource) {
          DataSource.network => DataProcessingMessage.fetchedFromNetwork,
          DataSource.cache => DataProcessingMessage.loadedFromCache,
        };
        emit(state.notification(message));
      }
      add(_RetrievalDateVisibilityCheckRequested());
    } on NoDataInCacheException {
      emit(state.notification(DataProcessingMessage.noDataInLocalCache));
    } on RemoteHostNotReachedException {
      emit(state.notification(DataProcessingMessage.errorNoInternet));
    } on Object catch (_) {
      emit(state.notification(DataProcessingMessage.unknownError));
      // Неизвестные ошибки обязательно прокидываем дальше, чтобы они не затерялись
      // и ушли в аналитику / консоль
      rethrow;
    } finally {
      emit(state.idle());
    }
  }

  void _checkRetrievalDateVisibility(
    _RetrievalDateVisibilityCheckRequested _,
    Emitter<ArticlesState> emit,
  ) {
    final DateTime? lastRetrievedTime = state.lastRetrievedTime;

    if (lastRetrievedTime == null) {
      emit(state.copyWith(shownLastRetrievedTime: null));
      return;
    }

    final DateTime now = DateTime.now();
    final Duration difference = now.difference(lastRetrievedTime);
    final int minutesSinceRetrieval = difference.inMinutes;
    final bool showLastRetrievedTime = minutesSinceRetrieval > 1;

    if (showLastRetrievedTime) {
      emit(state.copyWith(shownLastRetrievedTime: lastRetrievedTime));
    } else {
      emit(state.copyWith(shownLastRetrievedTime: null));
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();

    return super.close();
  }
}
