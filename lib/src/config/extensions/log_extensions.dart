import 'package:flutter/foundation.dart';

const tag = "APPTAG";
extension Logv on String {
  logv() {
    if (kDebugMode) {
      print("$tag: $this");
    }
  }
}