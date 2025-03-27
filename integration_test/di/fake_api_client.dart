import 'package:article_browser/data/api/api_client.dart';
import 'package:article_browser/data/models/article_data/article_data.dart';
import 'package:article_browser/data/models/comment_data/comment_data.dart';

class FakeApiClient implements ApiClient {
  @override
  Future<List<ArticleData>> fetchArticles() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      ArticleData(
        id: 1,
        userId: 1,
        title: 'Fake Article 1',
        body: 'This is a fake body',
      ),
      ArticleData(
        id: 2,
        userId: 1,
        title: 'Fake Article 2',
        body: 'Another fake body',
      ),
    ];
  }

  @override
  Future<ArticleData> fetchArticleDetails(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return ArticleData(
      id: id,
      userId: 1,
      title: 'Fake Article Detail',
      body: 'Detailed fake content for article $id',
    );
  }

  @override
  Future<List<CommentData>> fetchComments(int articleId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      CommentData(
        id: 1,
        postId: articleId,
        email: 'qwe@gmail.com',
        name: 'John Doe',
        body: 'This is a fake comment',
      ),
      CommentData(
        id: 2,
        postId: articleId,
        email: 'qwe@gmail.com',
        name: 'Jane Doe',
        body: 'Another fake comment',
      ),
    ];
  }
}
