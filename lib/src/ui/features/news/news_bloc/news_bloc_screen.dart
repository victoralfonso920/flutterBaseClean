import 'package:clean_core/src/ui/features/news/news_bloc/list_news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/service_locator.dart';
import '../../../../tools/utils_data.dart';
import '../bloc/news_cubit.dart';

class NewsScreenBloc extends StatelessWidget {
  const NewsScreenBloc({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    //Injector
    final NewsCubit viewModel = sl.get<NewsCubit>();
    activeInterceptor(context);

    return BlocProvider<NewsCubit>(
      create: (_) => viewModel..loadData(),
      child: const NewsScreenBloc(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadCompleteState) {
            return ListItemBloc(articles: state.news);
          } else if (state is NewsErrorState) {
            return Text(state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
