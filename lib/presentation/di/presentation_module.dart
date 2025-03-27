import 'package:article_browser/data/providers/local_storage_provider.dart';
import 'package:article_browser/domain/use_cases/load_article_previews.dart';
import 'package:article_browser/presentation/blocs/articles_bloc/articles_bloc.dart';
import 'package:article_browser/presentation/blocs/user_settings_cubit/user_settings_cubit.dart';
import 'package:cherrypick/cherrypick.dart';

class PresentationModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<ArticlesBloc>().toProvide(
      () => ArticlesBloc(currentScope.resolve<LoadArticlePreviews>()),
    );

    bind<UserSettingsCubit>().toProvide(
      () => UserSettingsCubit(currentScope.resolve<LocalStorageProvider>()),
    );
  }
}
