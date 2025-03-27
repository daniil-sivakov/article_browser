import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:article_browser/domain/models/article/article.dart';
import 'package:article_browser/domain/models/article_previews/article_previews.dart';
import 'package:article_browser/domain/models/data_source/data_source.dart';
import 'package:article_browser/domain/models/reception_details/reception_details.dart';
import 'package:article_browser/domain/use_cases/load_article_previews.dart';
import 'package:article_browser/presentation/blocs/articles_bloc/articles_bloc.dart';
import 'package:article_browser/presentation/blocs/articles_bloc/articles_state.dart';
import 'package:article_browser/presentation/messages/data_processing_message.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<LoadArticlePreviews>()])
import 'articles_bloc_test.mocks.dart';

void main() {
  late MockLoadArticlePreviews loadArticlePreviews;

  setUp(() {
    loadArticlePreviews = MockLoadArticlePreviews();
  });

  blocTest(
    'emits notification(errorNoInternet) when RemoteHostNotReachedException is thrown',
    build: () {
      when(
        loadArticlePreviews.execute(),
      ).thenThrow(RemoteHostNotReachedException());
      return ArticlesBloc(loadArticlePreviews);
    },
    act: (bloc) => bloc.add(ArticlesEvent.dataUpdateRequested()),
    expect: () {
      return [
        isA<ProcessingArticlesState>(),
        isA<NotificationArticlesState>().having(
          (state) => state.message,
          'message',
          equals(DataProcessingMessage.errorNoInternet),
        ),
        isA<IdleArticlesState>(),
      ];
    },
    verify: (_) {
      verify(loadArticlePreviews.execute()).called(1);
    },
  );

  blocTest(
    'Emits notification(unknown error) and rethrows when non-domain exception is thrown',
    build: () {
      when(loadArticlePreviews.execute()).thenThrow(StateError(''));
      return ArticlesBloc(loadArticlePreviews);
    },
    act: (bloc) => bloc.add(ArticlesEvent.dataUpdateRequested()),
    expect: () {
      return [
        isA<ProcessingArticlesState>(),
        isA<NotificationArticlesState>().having(
          (state) => state.message,
          'message',
          equals(DataProcessingMessage.unknownError),
        ),
        isA<IdleArticlesState>(),
      ];
    },
    verify: (_) {
      verify(loadArticlePreviews.execute()).called(1);
    },
    errors: () => [isA<StateError>()],
  );

  blocTest(
    'Emits progress, notification, idle in order when use case works as expected',
    build: () {
      when(loadArticlePreviews.execute()).thenAnswer((_) async* {
        yield ArticlePreviews(
          receptionDetails: ReceptionDetails(
            dataSource: DataSource.network,
            dataReceivedAt: DateTime.now(),
          ),
          data: [Article(id: 1, title: 'Test Article', body: '', userId: 1)],
        );
      });
      return ArticlesBloc(loadArticlePreviews);
    },
    act: (bloc) => bloc.add(ArticlesEvent.dataUpdateRequested()),
    expect: () {
      return [
        isA<ProcessingArticlesState>(),
        isA<ProcessingArticlesState>(),
        isA<NotificationArticlesState>().having(
          (state) => state.message,
          'message',
          equals(DataProcessingMessage.fetchedFromNetwork),
        ),
        isA<IdleArticlesState>(),
      ];
    },
    verify: (_) {
      verify(loadArticlePreviews.execute()).called(1);
    },
  );
}
