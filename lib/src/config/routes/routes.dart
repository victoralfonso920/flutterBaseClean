
import 'dart:io';

import 'package:flutter/material.dart';
import '../../domain/entities/article.dart';
import '../../ui/features/pages/article_detail/article_detail.dart';
import '../../ui/features/pages/home/daily_news.dart';
import '../../ui/features/pages/saved_article/saved_article.dart';

class Routes {
  static const home = '/';
  static const articleDetails = '/ArticleDetails';
  static const savedArticles = '/SavedArticles';

  Route routes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case home:
        return _createRoute(
          settings,
              (context) => DailyNews.create(context),
        );
      case articleDetails:
        return _createRoute(
          settings,
              (context) => ArticleDetailsView(article: args! as ArticleEntity),
        );
      case savedArticles:
        return _createRoute(
          settings,
              (context) => SavedArticles.create(context),
        );
      default:
        _createRoute(
          settings,
              (context) =>  DailyNews(),
        );
    }
    throw Exception('This route does not exist');
  }

  Route _createRoute(
      RouteSettings? settings,
      Widget Function(BuildContext context) predicated,
      ) {
    if (Platform.isIOS) {
      return MaterialPageRoute(
          builder: (context) => predicated(context), settings: settings);
    }
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) =>
          predicated(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}