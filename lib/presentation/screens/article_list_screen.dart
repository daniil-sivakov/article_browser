import 'package:article_browser/presentation/localization/localization_plug.dart';
import 'package:article_browser/domain/models/article/article.dart';
import 'package:article_browser/presentation/blocs/articles_bloc/articles_bloc.dart';
import 'package:article_browser/presentation/blocs/articles_bloc/articles_state.dart';
import 'package:article_browser/presentation/messages/message_mapper.dart';
import 'package:article_browser/presentation/navigation/app_router.gr.dart';
import 'package:article_browser/presentation/utilities/hero_tags.dart';
import 'package:article_browser/presentation/utilities/show_message_extension.dart';
import 'package:article_browser/presentation/widgets/article_card.dart';
import 'package:article_browser/presentation/widgets/theme_selector_button.dart';
import 'package:article_browser/presentation/widgets/data_reception_time.dart';
import 'package:article_browser/presentation/widgets/loading_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ArticlesBloc>().add(ArticlesEvent.dataUpdateRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocalizationPlug.appTitle,
          style: TextStyle(color: ColorScheme.of(context).onPrimary),
        ),
        backgroundColor: ColorScheme.of(context).primary,
        actions: [
          BlocBuilder<ArticlesBloc, ArticlesState>(
            builder: (_, state) {
              return switch (state.shownLastRetrievedTime) {
                DateTime dateTime => DataReceptionTime(dateTime: dateTime),
                null => const SizedBox.shrink(),
              };
            },
          ),
          ThemeSelectorButton(),
        ],
      ),
      body: BlocConsumer<ArticlesBloc, ArticlesState>(
        listener: (context, state) {
          if (state case NotificationArticlesState(:final message)) {
            context.showMessage(MessageMapper().localize(context, message));
          }
        },
        builder: (context, state) {
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              final bloc = context.read<ArticlesBloc>();
              bloc.add(ArticlesEvent.dataUpdateRequested());
            },
            child: LoadingState(
              inProgress: state is ProcessingArticlesState,
              loadingIndicator: LoadingIndicator.circular,
              child: ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final Article article = state.data[index];
                  final int articleId = article.id;

                  return Hero(
                    tag: HeroTags.forArticle(articleId),
                    child: ArticleCard(
                      article: article,
                      showFullText: false,
                      onTap: () {
                        final StackRouter router = AutoRouter.of(context);
                        router.push(ArticleDetailsRoute(articleId: articleId));
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
