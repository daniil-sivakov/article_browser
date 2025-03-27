import 'package:article_browser/domain/use_cases/load_article_details.dart';
import 'package:article_browser/presentation/blocs/article_details_bloc/article_details_bloc.dart';
import 'package:cherrypick/cherrypick.dart';

class ArticleDetailsModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<ArticleDetailsBloc>().toProvideWithParams(
      (dynamic articleId) => ArticleDetailsBloc(
        articleId as int,
        currentScope.resolve<LoadArticleDetails>(),
      ),
    );
  }
}
