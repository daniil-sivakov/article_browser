import 'package:article_browser/core/services/network_connection_service.dart';
import 'package:article_browser/domain/repositories/article_details_repository.dart';
import 'package:article_browser/domain/repositories/article_previews_repository.dart';
import 'package:article_browser/domain/use_cases/load_article_details.dart';
import 'package:article_browser/domain/use_cases/load_article_previews.dart';
import 'package:cherrypick/cherrypick.dart';

class DomainModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<LoadArticleDetails>().toInstance(
      LoadArticleDetails(
        currentScope.resolve<ArticleDetailsRepository>(),
        currentScope.resolve<NetworkConnectionService>(),
      ),
    );

    bind<LoadArticlePreviews>().toInstance(
      LoadArticlePreviews(
        currentScope.resolve<ArticlePreviewsRepository>(),
        currentScope.resolve<NetworkConnectionService>(),
      ),
    );
  }
}
