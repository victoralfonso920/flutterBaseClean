import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

const tag = "APPTAG";
extension Logv on String {
  logv() {
    if (kDebugMode) {
      var logger = Logger();
      logger.v("$tag: $this");
    }
  }

  logd() {
    if (kDebugMode) {
      var logger = Logger();
      logger.d("$tag: $this");
    }
  }

  logi() {
    if (kDebugMode) {
      var logger = Logger();
      logger.i("$tag: $this");
    }
  }
  loge() {
    if (kDebugMode) {
      var logger = Logger();
      logger.e("$tag: $this");
    }
  }
  logw() {
    if (kDebugMode) {
      var logger = Logger();
      logger.wtf("$tag: $this");
    }
  }
}