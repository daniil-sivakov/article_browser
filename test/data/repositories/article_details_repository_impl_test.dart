import 'package:article_browser/data/api/api_client.dart';
import 'package:article_browser/data/factories/article_details_factory.dart';
import 'package:article_browser/data/models/article_data/article_data.dart';
import 'package:article_browser/data/models/comment_data/comment_data.dart';
import 'package:article_browser/data/providers/local_storage_provider.dart';
import 'package:article_browser/data/repositories/article_details_repository_impl.dart';
import 'package:article_browser/data/codecs/article_details_codec.dart';
import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:article_browser/domain/models/article_details/article_details.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([
  MockSpec<ApiClient>(),
  MockSpec<LocalStorageProvider>(),
  MockSpec<ArticleDetailsCodec>(),
  MockSpec<ArticleDetailsFactory>(),
  MockSpec<ArticleData>(),
  MockSpec<CommentData>(),
  MockSpec<ArticleDetails>(),
])
import 'article_details_repository_impl_test.mocks.dart';

void main() {
  late ArticleDetailsRepositoryImpl repository;
  late MockApiClient apiClient;
  late MockArticleDetailsFactory factory;
  late MockArticleDetailsCodec codec;
  late MockLocalStorageProvider localStorageProvider;

  setUp(() {
    localStorageProvider = MockLocalStorageProvider();
    apiClient = MockApiClient();
    codec = MockArticleDetailsCodec();
    factory = MockArticleDetailsFactory();
    repository = ArticleDetailsRepositoryImpl(
      apiClient,
      localStorageProvider,
      factory,
      codec,
    );
  });

  test('Should fetch article details from the API', () async {
    const int articleIdStub = 1;
    final expectedDetails = MockArticleDetails();

    when(
      apiClient.fetchArticleDetails(any),
    ).thenAnswer((_) async => MockArticleData());
    when(
      apiClient.fetchComments(articleIdStub),
    ).thenAnswer((_) async => <MockCommentData>[]);
    when(factory.createNetworkDetails(any, any)).thenReturn(expectedDetails);

    final result = await repository.fetchDetails(articleIdStub);

    expect(result, expectedDetails);
    verify(factory.createNetworkDetails(any, any)).called(1);
    verify(apiClient.fetchArticleDetails(articleIdStub)).called(1);
    verify(apiClient.fetchComments(articleIdStub)).called(1);
  });

  test('Should load cached article details successfully', () async {
    const int articleIdStub = 1;
    final expectedDetailsJsonString = '';
    final expectedDetails = MockArticleDetails();

    when(
      localStorageProvider.get(any),
    ).thenAnswer((_) async => expectedDetailsJsonString);

    when(
      codec.decodeDetailsFromJson(expectedDetailsJsonString),
    ).thenReturn(expectedDetails);

    final result = await repository.loadCachedDetails(articleIdStub);

    expect(result, expectedDetails);
    verify(localStorageProvider.get(any)).called(1);
    verify(codec.decodeDetailsFromJson(expectedDetailsJsonString)).called(1);
  });

  test('Should return null if no cached details are found', () async {
    const int articleIdStub = 1;

    when(localStorageProvider.get(any)).thenAnswer((_) async => null);

    final result = await repository.loadCachedDetails(articleIdStub);

    expect(result, isNull);
    verifyNever(codec.decodeDetailsFromJson(any));
    verify(localStorageProvider.get(any)).called(1);
  });

  test('Should save article details to local storage', () async {
    final articleDetails = MockArticleDetails();

    when(codec.encodeToJsonString(articleDetails)).thenReturn('');
    when(
      localStorageProvider.set(key: anyNamed('key'), value: anyNamed('value')),
    ).thenAnswer((_) async => Future.value());
    when(articleDetails.getArticleId()).thenReturn(1);

    expect(repository.saveDetailsToCache(articleDetails), completes);
    verify(codec.encodeToJsonString(any)).called(1);
    verify(
      localStorageProvider.set(key: anyNamed('key'), value: anyNamed('value')),
    ).called(1);
  });

  test(
    'fetchArticleDetails should return DomainException on DioException',
    () async {
      const int articleIdStub = 1;

      final dioException = DioException(
        requestOptions: RequestOptions(),
        response: Response(requestOptions: RequestOptions(), statusCode: 404),
      );

      when(
        apiClient.fetchArticleDetails(articleIdStub),
      ).thenThrow(dioException);

      expect(
        () => repository.fetchDetails(articleIdStub),
        throwsA(isA<DomainException>()),
      );
      verify(apiClient.fetchArticleDetails(articleIdStub)).called(1);
    },
  );

  test('fetch should rethrow on unknown error', () async {
    const int articleIdStub = 1;
    final unknownError = StateError('Unexpected error');

    when(apiClient.fetchArticleDetails(articleIdStub)).thenThrow(unknownError);

    expect(
      () => repository.fetchDetails(articleIdStub),
      throwsA(isA<StateError>()),
    );
    verify(apiClient.fetchArticleDetails(articleIdStub)).called(1);
  });

  test('local cache should clear data on unknown error', () async {
    const int articleIdStub = 1;
    const String cachedJsonString = 'cachedJsonString';

    when(
      localStorageProvider.get(any),
    ).thenAnswer((_) async => cachedJsonString);
    when(localStorageProvider.remove(any)).thenAnswer((_) async {});
    when(
      codec.decodeDetailsFromJson(any),
    ).thenThrow(StateError('Unknown cache error'));

    Object? actualError;
    try {
      await repository.loadCachedDetails(articleIdStub);
    } on Object catch (error) {
      actualError = error;
    }

    expect(actualError, isA<StateError>());
    verify(localStorageProvider.remove(any)).called(1);
  });
}
