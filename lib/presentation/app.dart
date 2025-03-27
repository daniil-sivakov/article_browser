import 'package:article_browser/presentation/blocs/articles_bloc/articles_bloc.dart';
import 'package:article_browser/presentation/blocs/user_settings_cubit/user_settings.dart';
import 'package:article_browser/presentation/blocs/user_settings_cubit/user_settings_cubit.dart';
import 'package:article_browser/presentation/di/article_details_module.dart';
import 'package:article_browser/presentation/di/presentation_module.dart';
import 'package:article_browser/presentation/localization/localization_plug.dart';
import 'package:article_browser/presentation/navigation/app_router.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _router = AppRouter();

  final Scope _currentScope = CherryPick.openRootScope().openSubScope(
    'presentation',
  );

  @override
  void initState() {
    super.initState();

    _currentScope.installModules([
      PresentationModule(),
      ArticleDetailsModule(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _currentScope.resolve<ArticlesBloc>()),
        BlocProvider(
          create: (_) => _currentScope.resolve<UserSettingsCubit>()..init(),
        ),
      ],
      child: _ThemeDataBuilder(
        builder: (themeData) {
          return MaterialApp.router(
            theme: themeData,
            onGenerateTitle: (_) => LocalizationPlug.appTitle,
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _currentScope.dropModules();

    super.dispose();
  }
}

class _ThemeDataBuilder extends StatelessWidget {
  const _ThemeDataBuilder({required this.builder});

  final Widget Function(ThemeData themeData) builder;

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = context.select(
      (UserSettingsCubit cubit) => cubit.state.appTheme,
    );

    final Brightness platformBrightness = MediaQuery.platformBrightnessOf(
      context,
    );

    final ThemeData themeData = switch ((appTheme, platformBrightness)) {
      (AppTheme.light, _) => ThemeData.light(),
      (AppTheme.dark, _) => ThemeData.dark(),
      (AppTheme.system, Brightness.light) => ThemeData.light(),
      (AppTheme.system, Brightness.dark) => ThemeData.dark(),
    };

    return builder(themeData);
  }
}
