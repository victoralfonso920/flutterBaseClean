import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/service_locator.dart';
import '../../../../config/routes/routes.dart';
import '../../../../domain/entities/article.dart';
import '../../../../domain/model/ui/ArticleUiState.dart';
import '../../cubit/remote/remote_article_cubit.dart';
import '../../widgets/article_tile.dart';
import '../../widgets/loaders/skeleton_loader_container.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  static RemoteArticleCubit cubit = sl.get<RemoteArticleCubit>();

  static Widget create(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: DailyNews(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _DailyNewsBodyContent(cubit: cubit);
  }
}

class _DailyNewsBodyContent extends StatefulWidget {
  const _DailyNewsBodyContent({Key? key, required this.cubit})
      : super(key: key);

  final RemoteArticleCubit cubit;

  @override
  State<StatefulWidget> createState() => _DailyNewsBodyContentState();
}

class _DailyNewsBodyContentState extends State<_DailyNewsBodyContent> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      body: _BuildBody(),
    );
  }
}

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Icons.bookmark, color: Colors.black),
            ),
          ),
        ],
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BuildBody extends StatelessWidget {
  const _BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context
        .select<RemoteArticleCubit, ArticleUiState>((cubit) => cubit.state);

    return Builder(builder: (context) {
      if (state.isError == true) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state.success == true) {
        return ListView.builder(
          itemCount: state.data?.length,
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: state.data?[index],
              onArticlePressed: (article) =>
                  _onArticlePressed(context, article),
            );
          },
        );
      }

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
    });
  }
}

void _onArticlePressed(BuildContext context, ArticleEntity article) {
  Navigator.pushNamed(context, Routes.articleDetails, arguments: article);
}

void _onShowSavedArticlesViewTapped(BuildContext context) {
  Navigator.pushNamed(context, Routes.savedArticles);
}

