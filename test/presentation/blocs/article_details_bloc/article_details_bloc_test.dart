import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:article_browser/domain/models/article/article.dart';
import 'package:article_browser/domain/models/article_details/article_details.dart';
import 'package:article_browser/domain/models/data_source/data_source.dart';
import 'package:article_browser/domain/models/reception_details/reception_details.dart';
import 'package:article_browser/domain/use_cases/load_article_details.dart';
import 'package:article_browser/presentation/blocs/article_details_bloc/article_details_bloc.dart';
import 'package:article_browser/presentation/blocs/article_details_bloc/article_details_state.dart';
import 'package:article_browser/presentation/messages/data_processing_message.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<LoadArticleDetails>()])
import 'article_details_bloc_test.mocks.dart';

void main() {
  late MockLoadArticleDetails loadArticleDetails;

  setUp(() {
    loadArticleDetails = MockLoadArticleDetails();
  });

  blocTest(
    'emits notification(errorNoInternet) when RemoteHostNotReachedException is thrown',
    build: () {
      when(
        loadArticleDetails.execute(any),
      ).thenThrow(RemoteHostNotReachedException());
      return ArticleDetailsBloc(1, loadArticleDetails);
    },
    act: (bloc) => bloc.add(ArticleDetailsEvent.dataUpdateRequested()),
    expect: () {
      return [
        isA<ProcessingArticleDetailsState>(),
        isA<NotificationArticleDetailsState>().having(
          (state) => state.message,
          'message',
          equals(DataProcessingMessage.errorNoInternet),
        ),
        isA<IdleArticleDetailsState>(),
      ];
    },
    verify: (_) {
      verify(loadArticleDetails.execute(any)).called(1);
    },
  );

  blocTest(
    'Emits notification(unknown error) and rethrows when non-domain exception is thrown',
    build: () {
      when(loadArticleDetails.execute(any)).thenThrow(StateError(''));
      return ArticleDetailsBloc(1, loadArticleDetails);
    },
    act: (bloc) => bloc.add(ArticleDetailsEvent.dataUpdateRequested()),
    expect: () {
      return [
        isA<ProcessingArticleDetailsState>(),
        isA<NotificationArticleDetailsState>().having(
          (state) => state.message,
          'message',
          equals(DataProcessingMessage.unknownError),
        ),
        isA<IdleArticleDetailsState>(),
      ];
    },
    verify: (_) {
      verify(loadArticleDetails.execute(any)).called(1);
    },
    errors: () => [isA<StateError>()],
  );

  blocTest(
    'Emits progress, notification, idle in order when use case works as expected',
    build: () {
      when(loadArticleDetails.execute(any)).thenAnswer((_) async* {
        yield ArticleDetails(
          receptionDetails: ReceptionDetails(
            dataReceivedAt: DateTime.now(),
            dataSource: DataSource.cache,
          ),
          comments: [],
          article: Article(id: 1, title: 'Test Article', body: '', userId: 1),
        );
      });
      return ArticleDetailsBloc(1, loadArticleDetails);
    },
    act: (bloc) => bloc.add(ArticleDetailsEvent.dataUpdateRequested()),
    expect: () {
      return [
        isA<ProcessingArticleDetailsState>(),
        isA<ProcessingArticleDetailsState>(),
        isA<NotificationArticleDetailsState>().having(
          (state) => state.message,
          'message',
          equals(DataProcessingMessage.loadedFromCache),
        ),
        isA<IdleArticleDetailsState>(),
      ];
    },
    verify: (_) {
      verify(loadArticleDetails.execute(any)).called(1);
    },
  );
}
