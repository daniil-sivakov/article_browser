import 'package:article_browser/data/models/article_data/article_data.dart';
import 'package:article_browser/data/models/comment_data/comment_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/posts")
  Future<List<ArticleData>> fetchArticles();

  @GET("/posts/{id}")
  Future<ArticleData> fetchArticleDetails(@Path("id") int id);

  @GET("/posts/{id}/comments")
  Future<List<CommentData>> fetchComments(@Path("id") int articleId);
}
