import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/config/di/service_locator.dart';
import 'src/ui/app.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await init();
  runApp(const App());
}



