import 'package:article_browser/core/services/network_connection_service.dart';
import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:article_browser/domain/models/article_previews/article_previews.dart';
import 'package:article_browser/domain/repositories/article_previews_repository.dart';
import 'package:article_browser/domain/use_cases/load_article_previews.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([
  MockSpec<NetworkConnectionService>(),
  MockSpec<ArticlePreviewsRepository>(),
  MockSpec<ArticlePreviews>(),
])
import 'load_article_previews_test.mocks.dart';

void main() {
  late MockArticlePreviewsRepository repository;
  late MockNetworkConnectionService connectionService;
  late LoadArticlePreviews useCase;

  setUp(() {
    repository = MockArticlePreviewsRepository();
    connectionService = MockNetworkConnectionService();
    useCase = LoadArticlePreviews(repository, connectionService);
  });

  test(
    'Should fetch article previews when there is internet connection',
    () async {
      final fetchedArticlePreviews = MockArticlePreviews();

      when(
        connectionService.checkConnection(),
      ).thenAnswer((_) async => NetworkConnectionState.hasConnection);
      when(
        repository.fetchPreviews(),
      ).thenAnswer((_) async => fetchedArticlePreviews);
      when(repository.savePreviewsToCache(any)).thenAnswer((_) async {});

      ArticlePreviews? previews;
      await for (final result in useCase.execute()) {
        previews = result;
      }

      expect(previews, fetchedArticlePreviews);
      verify(repository.fetchPreviews()).called(1);
      verify(repository.savePreviewsToCache(any)).called(1);
    },
  );

  test(
    'Should load cached previews when there is no internet connection',
    () async {
      final cachedPreviews = MockArticlePreviews();
      final previewsWithProperDataSource = MockArticlePreviews();

      when(
        connectionService.checkConnection(),
      ).thenAnswer((_) async => NetworkConnectionState.noConnection);
      when(cachedPreviews.asCached()).thenReturn(previewsWithProperDataSource);
      when(
        repository.loadCachedPreviews(),
      ).thenAnswer((_) async => cachedPreviews);

      ArticlePreviews? previews;
      await for (final result in useCase.execute()) {
        previews = result;
      }

      verify(cachedPreviews.asCached()).called(1);
      expect(previews, previewsWithProperDataSource);
      verify(repository.loadCachedPreviews()).called(1);
      verifyNever(repository.fetchPreviews());
    },
  );

  test(
    'Should throw NoDataInCacheException when no cached previews exist',
    () async {
      when(
        connectionService.checkConnection(),
      ).thenAnswer((_) async => NetworkConnectionState.noConnection);
      when(repository.loadCachedPreviews()).thenAnswer((_) async => null);

      expect(
        () => useCase.execute().first,
        throwsA(isA<NoDataInCacheException>()),
      );
    },
  );

  test('Should return result if local storage failed to save data', () async {
    final fetchedArticlePreviews = MockArticlePreviews();
    final Error errorFromLocalStorage = Error();

    when(
      connectionService.checkConnection(),
    ).thenAnswer((_) async => NetworkConnectionState.hasConnection);
    when(
      repository.fetchPreviews(),
    ).thenAnswer((_) async => fetchedArticlePreviews);
    when(repository.savePreviewsToCache(any)).thenThrow(errorFromLocalStorage);

    ArticlePreviews? expectedPreviews;
    Object? expectedError;
    try {
      await for (final result in useCase.execute()) {
        expectedPreviews = result;
      }
    } on Object catch (error) {
      expectedError = error;
    }

    expect(expectedPreviews, fetchedArticlePreviews);
    expect(expectedError, errorFromLocalStorage);
    verify(repository.fetchPreviews()).called(1);
    verify(repository.savePreviewsToCache(any)).called(1);
  });
}
