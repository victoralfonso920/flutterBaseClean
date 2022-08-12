import 'package:clean_core/src/App.dart';
import 'package:clean_core/src/data/remote/api/provider/ApiProvider.dart';
import 'package:clean_core/src/data/remote/tools/api_const.dart';
import 'package:flutter/material.dart';
import 'package:clean_core/src/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  init();
  final provider = sl.get<ApiProvider>(param1: baseUrl);
  runApp(
    RepositoryProvider(
      create: (_) => provider,
      child: MyApp(),
    ),
  );
}

