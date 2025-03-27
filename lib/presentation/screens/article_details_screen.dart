import 'package:article_browser/presentation/blocs/article_details_bloc/article_details_bloc.dart';
import 'package:article_browser/presentation/blocs/article_details_bloc/article_details_state.dart';
import 'package:article_browser/presentation/messages/message_mapper.dart';
import 'package:article_browser/presentation/utilities/hero_tags.dart';
import 'package:article_browser/presentation/utilities/show_message_extension.dart';
import 'package:article_browser/presentation/widgets/article_card.dart';
import 'package:article_browser/presentation/widgets/comment_card.dart';
import 'package:article_browser/presentation/widgets/custom_list_item_transition.dart';
import 'package:article_browser/presentation/widgets/loading_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.articleId});

  final int articleId;

  @override
  Widget build(BuildContext context) {
    final Scope currentScope = CherryPick.openRootScope().openSubScope(
      'presentation',
    );
    return BlocProvider<ArticleDetailsBloc>(
      create: (_) {
        return currentScope.resolve<ArticleDetailsBloc>(params: articleId)
          ..add(ArticleDetailsEvent.dataUpdateRequested());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorScheme.of(context).primary,
          foregroundColor: ColorScheme.of(context).onPrimary,
        ),
        body: BlocListener<ArticleDetailsBloc, ArticleDetailsState>(
          listener: (context, state) {
            if (state case NotificationArticleDetailsState(:final message)) {
              context.showMessage(MessageMapper().localize(context, message));
            }
          },
          child: _ArticleDetailsContent(articleId: articleId),
        ),
      ),
    );
  }
}

class _ArticleDetailsContent extends StatefulWidget {
  const _ArticleDetailsContent({required this.articleId});

  final int articleId;

  @override
  State<_ArticleDetailsContent> createState() => _ArticleDetailsContentState();
}

class _ArticleDetailsContentState extends State<_ArticleDetailsContent> {
  DateTime _firstItemTriggerTime = DateTime.now();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final ArticleDetailsBloc bloc = context.watch<ArticleDetailsBloc>();

    if (bloc.state case IdleArticleDetailsState(
      :final comments,
    ) when comments.isNotEmpty) {
      _firstItemTriggerTime = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ArticleDetailsBloc bloc = context.watch<ArticleDetailsBloc>();
    final ArticleDetailsState state = bloc.state;

    return LoadingState(
      loadingIndicator: LoadingIndicator.circular,
      inProgress: state is ProcessingArticleDetailsState,
      child: RefreshIndicator(
        onRefresh: () async {
          bloc.add(ArticleDetailsEvent.dataUpdateRequested());
        },
        child: CustomScrollView(
          slivers: [
            SliverFloatingHeader(
              child: Hero(
                tag: HeroTags.forArticle(widget.articleId),
                child: ArticleCard(
                  article: state.article,
                  showFullText: true,
                  showNoDataMessage: state.noDataFound,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.comments.length,
                (_, index) => CustomListItemTransition(
                  key: ValueKey(state.comments[index].hashCode),
                  runBackwards: state is ProcessingArticleDetailsState,
                  runAnimationAfter: _getTriggerTime(index),
                  child: CommentCard(comment: state.comments[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DateTime _getTriggerTime(int articleIndex) {
    const Duration initialDelay = Duration(milliseconds: 300);
    const Duration timeForEachItemToAppear = Duration(milliseconds: 250);
    final DateTime triggerTimeForArticle = _firstItemTriggerTime
        .add(initialDelay)
        .add(timeForEachItemToAppear * articleIndex);

    return triggerTimeForArticle;
  }
}
