// Fetch content from the json file
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:network_logger/network_logger.dart';

Future<String> readJson(String filePath) async {
  final String response = await File(filePath).readAsString();
  return response;
}

void activeInterceptor(BuildContext context){
  if(kDebugMode){
    NetworkLoggerOverlay.attachTo(context);
  }
}
