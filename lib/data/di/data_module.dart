import 'package:article_browser/core/logging/logger.dart';
import 'package:article_browser/core/services/network_connection_service.dart';
import 'package:article_browser/data/api/api_client.dart';
import 'package:article_browser/data/api/dio.dart';
import 'package:article_browser/data/providers/local_storage_provider.dart';
import 'package:article_browser/data/providers/shared_preferences_storage_provider.dart';
import 'package:article_browser/data/repositories/article_details_repository_impl.dart';
import 'package:article_browser/data/repositories/article_previews_repository_impl.dart';
import 'package:article_browser/data/services/simple_network_connection_service.dart';
import 'package:article_browser/domain/repositories/article_details_repository.dart';
import 'package:article_browser/domain/repositories/article_previews_repository.dart';
import 'package:cherrypick/cherrypick.dart';

class DataModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<ApiClient>().toInstance(
      ApiClient(createDio(currentScope.resolve<Logger>())),
    );

    bind<NetworkConnectionService>().toInstance(
      SimpleNetworkConnectionService(currentScope.resolve<Logger>()),
    );

    bind<LocalStorageProvider>().toInstance(SharedPreferencesStorageProvider());

    bind<ArticleDetailsRepository>().toInstance(
      ArticleDetailsRepositoryImpl(
        currentScope.resolve<ApiClient>(),
        currentScope.resolve<LocalStorageProvider>(),
      ),
    );

    bind<ArticlePreviewsRepository>().toInstance(
      ArticlePreviewsRepositoryImpl(
        currentScope.resolve<ApiClient>(),
        currentScope.resolve<LocalStorageProvider>(),
      ),
    );
  }
}
