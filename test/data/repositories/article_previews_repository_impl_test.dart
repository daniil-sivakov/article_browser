import 'package:article_browser/data/api/api_client.dart';
import 'package:article_browser/data/repositories/article_previews_repository_impl.dart';
import 'package:article_browser/data/transformers/article_previews_factory.dart';
import 'package:article_browser/data/models/article_data/article_data.dart';
import 'package:article_browser/data/providers/local_storage_provider.dart';
import 'package:article_browser/data/transformers/article_previews_codec.dart';
import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:article_browser/domain/models/article_previews/article_previews.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([
  MockSpec<ApiClient>(),
  MockSpec<LocalStorageProvider>(),
  MockSpec<ArticlePreviewsCodec>(),
  MockSpec<ArticlePreviewsFactory>(),
  MockSpec<ArticleData>(),
  MockSpec<ArticlePreviews>(),
])
import 'article_previews_repository_impl_test.mocks.dart';

void main() {
  late ArticlePreviewsRepositoryImpl repository;
  late MockApiClient apiClient;
  late MockArticlePreviewsFactory factory;
  late MockArticlePreviewsCodec codec;
  late MockLocalStorageProvider localStorageProvider;

  setUp(() {
    localStorageProvider = MockLocalStorageProvider();
    apiClient = MockApiClient();
    codec = MockArticlePreviewsCodec();
    factory = MockArticlePreviewsFactory();
    repository = ArticlePreviewsRepositoryImpl(
      apiClient,
      localStorageProvider,
      factory,
      codec,
    );
  });

  test('Should fetch article previews from the API', () async {
    final expectedPreviews = MockArticlePreviews();
    final articlesData = [MockArticleData()];

    when(apiClient.fetchArticles()).thenAnswer((_) async => articlesData);
    when(
      factory.createNetworkPreviews(articlesData),
    ).thenReturn(expectedPreviews);

    final result = await repository.fetchPreviews();

    expect(result, expectedPreviews);
    verify(factory.createNetworkPreviews(any)).called(1);
    verify(apiClient.fetchArticles()).called(1);
  });

  test('Should load cached article previews successfully', () async {
    final expectedPreviewsJsonString = '';
    final expectedPreviews = MockArticlePreviews();

    when(
      localStorageProvider.get(any),
    ).thenAnswer((_) async => expectedPreviewsJsonString);

    when(
      codec.decodeDetailsFromJson(expectedPreviewsJsonString),
    ).thenReturn(expectedPreviews);

    final result = await repository.loadCachedPreviews();

    expect(result, expectedPreviews);
    verify(localStorageProvider.get(any)).called(1);
    verify(codec.decodeDetailsFromJson(expectedPreviewsJsonString)).called(1);
  });

  test('Should return null if no cached previews are found', () async {
    when(localStorageProvider.get(any)).thenAnswer((_) async => null);

    final result = await repository.loadCachedPreviews();

    expect(result, isNull);
    verifyNever(codec.decodeDetailsFromJson(any));
    verify(localStorageProvider.get(any)).called(1);
  });

  test('Should save article previews to local storage', () async {
    final articlePreviews = MockArticlePreviews();

    when(codec.encodeToJsonString(articlePreviews)).thenReturn('');
    when(
      localStorageProvider.set(key: anyNamed('key'), value: anyNamed('value')),
    ).thenAnswer((_) => Future.value());

    expect(repository.savePreviewsToCache(articlePreviews), completes);
    verify(codec.encodeToJsonString(any)).called(1);
    verify(
      localStorageProvider.set(key: anyNamed('key'), value: anyNamed('value')),
    ).called(1);
  });

  test('fetchArticles should return DomainException on DioException', () async {
    final dioException = DioException(
      requestOptions: RequestOptions(),
      response: Response(requestOptions: RequestOptions(), statusCode: 404),
    );

    when(apiClient.fetchArticles()).thenThrow(dioException);

    expect(() => repository.fetchPreviews(), throwsA(isA<DomainException>()));
    verify(apiClient.fetchArticles()).called(1);
  });

  test('fetch should rethrow on unknown error', () async {
    final unknownError = StateError('Unexpected error');

    when(apiClient.fetchArticles()).thenThrow(unknownError);

    expect(() => repository.fetchPreviews(), throwsA(isA<StateError>()));
    verify(apiClient.fetchArticles()).called(1);
  });

  test('local cache should clear data on error while parsing', () async {
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
      await repository.loadCachedPreviews();
    } on Object catch (error) {
      actualError = error;
    }

    expect(actualError, isA<StateError>());
    verify(localStorageProvider.remove(any)).called(1);
  });
}
