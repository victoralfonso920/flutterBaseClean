import 'package:flutter/material.dart';
import 'navigation/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (settings) => Routes.routes(settings),
    );
  }
}