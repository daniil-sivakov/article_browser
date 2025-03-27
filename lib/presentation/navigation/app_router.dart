import 'package:article_browser/presentation/navigation/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/home', page: ArticleListRoute.page, initial: true),
    AutoRoute(path: '/articles/:articleId', page: ArticleDetailsRoute.page),
  ];
}
