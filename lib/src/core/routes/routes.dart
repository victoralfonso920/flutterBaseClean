
import 'dart:io';

import 'package:clean_core/src/ui/features/news/news_screen.dart';
import 'package:flutter/material.dart';

import '../../ui/features/news/detail_news/news_details_screen.dart';

class Routes {
  static const home = '/';
  static const newsDetails = '/details';

  Route routes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case home:
        return _createRoute(
          settings,
              (context) =>  HomeScreen.create(context),
        );
      case newsDetails:
        return _createRoute(
          settings,
              (context) => NewsDetailsScreen.create(args!),
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