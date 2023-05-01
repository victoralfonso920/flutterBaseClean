import 'package:clean_core/src/core/extensions/log_extensions.dart';
import 'package:clean_core/src/data/remote/dto/news_model.dart';
import 'package:clean_core/src/domain/model/home_ui_state.dart';
import 'package:clean_core/src/ui/features/news/widgets/list_news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/resources/strings.dart';
import '../../tools/utils.dart';
import '../../widgets/loaders/skeleton_loader_container.dart';
import 'news_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static NewsViewModel viewModel = sl.get<NewsViewModel>();

  static Widget create(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsViewModel>(create: (context) => viewModel..loadData()),
      ],
      child: const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeNotificationBarColorIcon(isLight: false);
    return Scaffold(
      body: Builder(builder: (context) {
      final state = context.select<NewsViewModel, HomeUiState>((cubit) => cubit.state);
          final List<Article> list = viewModel.getFakeArticle();
          bool load = true;
          state.toString().logv();
          if (state.news != null) {
            list.clear();
            list.addAll(state.news ?? []);
            load = false;
          } else if (state.isError) {
            list.clear();
            load = false;
            return const Text(errorListArticles);
          }
          return  SkeletonLoaderContainer(
            ListItemBloc(articles: list),
            isLoading: load,
          );

        },
      )
    );
  }
}