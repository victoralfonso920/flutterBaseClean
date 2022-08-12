import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/features/news/detail_news/news_details_screen.dart';
import '../ui/features/news/news_bloc/news_bloc_screen.dart';

class Routes {
  static const topNews = '/';
  static const newsDetails = '/details';

  static Route routes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case topNews:
        return MaterialPageRoute(builder: (context) => NewsScreenBloc.create(context));
      case newsDetails:
        return MaterialPageRoute(builder: (_) => NewsDetailsScreen.create(args!));
    }
    throw Exception('This route does not exists');
  }
}
