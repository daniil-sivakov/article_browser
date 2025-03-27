import 'package:article_browser/core/services/network_connection_service.dart';
import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:article_browser/domain/models/article_details/article_details.dart';
import 'package:article_browser/domain/repositories/article_details_repository.dart';
import 'package:article_browser/domain/use_cases/load_article_details.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([
  MockSpec<NetworkConnectionService>(),
  MockSpec<ArticleDetailsRepository>(),
  MockSpec<ArticleDetails>(),
])
import 'load_article_details_test.mocks.dart';

void main() {
  late MockArticleDetailsRepository repository;
  late MockNetworkConnectionService connectionService;
  late LoadArticleDetails useCase;

  setUp(() {
    repository = MockArticleDetailsRepository();
    connectionService = MockNetworkConnectionService();
    useCase = LoadArticleDetails(repository, connectionService);
  });

  test(
    'Should fetch article details when there is internet connection',
    () async {
      const int articleIdStub = 1;
      final fetchedArticleDetails = MockArticleDetails();

      when(
        connectionService.checkConnection(),
      ).thenAnswer((_) async => NetworkConnectionState.hasConnection);
      when(
        repository.fetchDetails(any),
      ).thenAnswer((_) async => fetchedArticleDetails);
      when(repository.saveDetailsToCache(any)).thenAnswer((_) async {});

      ArticleDetails? details;
      await for (final result in useCase.execute(articleIdStub)) {
        details = result;
      }

      expect(details, fetchedArticleDetails);
      verify(repository.fetchDetails(any)).called(1);
      verify(repository.saveDetailsToCache(any)).called(1);
    },
  );

  test(
    'Should load cached details when there is no internet connection',
    () async {
      const int articleIdStub = 1;
      final cachedDetails = MockArticleDetails();
      final detailsWithProperDataSource = MockArticleDetails();

      when(
        connectionService.checkConnection(),
      ).thenAnswer((_) async => NetworkConnectionState.noConnection);
      when(cachedDetails.asCached()).thenReturn(detailsWithProperDataSource);
      when(
        repository.loadCachedDetails(any),
      ).thenAnswer((_) async => cachedDetails);

      ArticleDetails? details;
      await for (final result in useCase.execute(articleIdStub)) {
        details = result;
      }

      verify(cachedDetails.asCached()).called(1);
      expect(details, detailsWithProperDataSource);
      verify(repository.loadCachedDetails(any)).called(1);
      verifyNever(repository.fetchDetails(any));
    },
  );

  test(
    'Should throw NoDataInCacheException when no cached details exist',
    () async {
      const int articleIdStub = 1;

      when(
        connectionService.checkConnection(),
      ).thenAnswer((_) async => NetworkConnectionState.noConnection);
      when(repository.loadCachedDetails(any)).thenAnswer((_) async => null);

      expect(
        () => useCase.execute(articleIdStub).first,
        throwsA(isA<NoDataInCacheException>()),
      );
    },
  );

  test('Should return result if local storage failed to save data', () async {
    const int articleIdStub = 1;
    final fetchedArticleDetails = MockArticleDetails();
    final Error errorFromLocalStorage = Error();

    when(
      connectionService.checkConnection(),
    ).thenAnswer((_) async => NetworkConnectionState.hasConnection);
    when(
      repository.fetchDetails(articleIdStub),
    ).thenAnswer((_) async => fetchedArticleDetails);
    when(repository.saveDetailsToCache(any)).thenThrow(errorFromLocalStorage);

    ArticleDetails? expectedDetails;
    Object? expectedError;
    try {
      await for (final result in useCase.execute(articleIdStub)) {
        expectedDetails = result;
      }
    } on Object catch (error) {
      expectedError = error;
    }

    expect(expectedDetails, fetchedArticleDetails);
    expect(expectedError, errorFromLocalStorage);
    verify(repository.fetchDetails(any)).called(1);
    verify(repository.saveDetailsToCache(any)).called(1);
  });
}
