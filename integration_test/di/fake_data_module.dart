import 'package:article_browser/core/services/network_connection_service.dart';
import 'package:article_browser/data/api/api_client.dart';
import 'fake_api_client.dart';
import 'fake_network_connection_service.dart';
import 'package:article_browser/data/providers/local_storage_provider.dart';
import 'package:article_browser/data/repositories/article_details_repository_impl.dart';
import 'package:article_browser/data/repositories/article_previews_repository_impl.dart';
import 'package:article_browser/domain/repositories/article_details_repository.dart';
import 'package:article_browser/domain/repositories/article_previews_repository.dart';
import 'package:cherrypick/cherrypick.dart';

import 'in_memory_local_storage_provider.dart';

class FakeDataModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<ApiClient>().toInstance(FakeApiClient());

    bind<NetworkConnectionService>().toInstance(FakeNetworkConnectionService());

    bind<LocalStorageProvider>().toInstance(InMemoryLocalStorageProvider());

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
