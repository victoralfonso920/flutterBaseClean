import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../config/di/service_locator.dart';
import '../../../../config/routes/routes.dart';
import '../../../../domain/entities/article.dart';
import '../../../../domain/model/ui/ArticleUiState.dart';
import '../../cubit/local/local_article_cubit.dart';
import '../../widgets/article_tile.dart';
import '../../widgets/loaders/skeleton_loader_container.dart';

class SavedArticles extends HookWidget {
  const SavedArticles({Key? key}) : super(key: key);

  static LocalArticleCubit cubit = sl.get<LocalArticleCubit>();

  static Widget create(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: SavedArticles(),
    );
  }

  @override
  Widget build(BuildContext context) => _SavedArticlesBodyContent(cubit: cubit);
}

class _SavedArticlesBodyContent extends StatefulWidget {
  const _SavedArticlesBodyContent({Key? key, required this.cubit})
      : super(key: key);

  final LocalArticleCubit cubit;

  @override
  State<StatefulWidget> createState() => _SavedArticlesBodyContentState();
}

class _SavedArticlesBodyContentState extends State<_SavedArticlesBodyContent> {
  @override
  void initState() {
    super.initState();
    widget.cubit.onGetSavedArticles();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context),
      );
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    leading: Builder(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onBackButtonTapped(context),
        child: const Icon(Ionicons.chevron_back, color: Colors.black),
      ),
    ),
    title: const Text('Saved Articles', style: TextStyle(color: Colors.black)),
  );
}

Widget _buildBody(BuildContext context) {
  final state = context
      .select<LocalArticleCubit, ArticleUiState>((cubit) => cubit.state);

  return Builder(builder: (context) {
      if (state.isLoading == true) {
        return ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) => SkeletonLoaderContainer(
            SkeletonLoaderUtils.container(
                ArticleWidget(article: ArticleEntity.createEmptyInstance(),),
                isLoading: true
            ),
            isLoading: true,
          ),
          separatorBuilder: (context, index) =>
          const SizedBox(height: 16),
        );
      } else if (state.success == true) {
        return _buildArticlesList(state.data!);
      }
      return Container();
    },
  );
}

Widget _buildArticlesList(List<ArticleEntity> articles) {
  if (articles.isEmpty) {
    return const Center(
        child: Text(
      'NO SAVED ARTICLES',
      style: TextStyle(color: Colors.black),
    ));
  }

  return ListView.builder(
    itemCount: articles.length,
    itemBuilder: (context, index) {
      return ArticleWidget(
        article: articles[index],
        isRemovable: true,
        onRemove: (article) => _onRemoveArticle(context, article),
        onArticlePressed: (article) => _onArticlePressed(context, article),
      );
    },
  );
}

void _onBackButtonTapped(BuildContext context) {
  Navigator.pop(context);
}

void _onRemoveArticle(BuildContext context, ArticleEntity article) {
  BlocProvider.of<LocalArticleCubit>(context).onRemoveArticle(article);
}

void _onArticlePressed(BuildContext context, ArticleEntity article) {
  Navigator.pushNamed(context, Routes.articleDetails, arguments: article);
}
