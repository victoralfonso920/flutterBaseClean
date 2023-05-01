import 'package:clean_core/src/core/di/service_locator.dart';
import 'package:clean_core/src/data/remote/api/provider/api_provider.dart';
import 'package:clean_core/src/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  init();
  final provider = sl.get<ApiProvider>();
  runApp(
    RepositoryProvider(
      create: (_) => provider,
      child: const App(),
    ),
  );
}


