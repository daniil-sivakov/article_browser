import 'package:article_browser/presentation/localization/localization_plug.dart';
import 'package:article_browser/domain/models/article/article.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
    required this.showFullText,
    this.showNoDataMessage = false,
    this.onTap,
  });

  final Article? article;
  final bool showFullText;
  final bool showNoDataMessage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: AnimatedSize(
        alignment: Alignment.topCenter,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: switch ((article, showNoDataMessage)) {
          (_, true) => Padding(
            padding: const EdgeInsets.all(16),
            child: Text(LocalizationPlug.noDataForArticleText),
          ),
          (null, _) => const SizedBox(height: 48),
          (Article article, _) => ListTile(
            title: Text(article.title),
            subtitle: Text(article.body, maxLines: showFullText ? null : 2),
            onTap: onTap,
          ),
        },
      ),
    );
  }
}
