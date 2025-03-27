// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:article_browser/presentation/screens/article_details_screen.dart'
    as _i1;
import 'package:article_browser/presentation/screens/article_list_screen.dart'
    as _i2;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.ArticleDetailsScreen]
class ArticleDetailsRoute extends _i3.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    _i4.Key? key,
    required int articleId,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         ArticleDetailsRoute.name,
         args: ArticleDetailsRouteArgs(key: key, articleId: articleId),
         initialChildren: children,
       );

  static const String name = 'ArticleDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleDetailsRouteArgs>();
      return _i1.ArticleDetailsScreen(key: args.key, articleId: args.articleId);
    },
  );
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({this.key, required this.articleId});

  final _i4.Key? key;

  final int articleId;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, articleId: $articleId}';
  }
}

/// generated route for
/// [_i2.ArticleListScreen]
class ArticleListRoute extends _i3.PageRouteInfo<void> {
  const ArticleListRoute({List<_i3.PageRouteInfo>? children})
    : super(ArticleListRoute.name, initialChildren: children);

  static const String name = 'ArticleListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.ArticleListScreen();
    },
  );
}
