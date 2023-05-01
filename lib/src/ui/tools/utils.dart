import 'package:clean_core/src/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/tools/const.dart';

TextStyle getCustomFontTextStyle(
    {colorText = Colors.blueAccent,
      fontFamilyFont= gothamFontFamily,
      fontWeightFont = FontWeight.w400,
      fontSizeFont = 36.0}
    ) {
  // text style which defines a custom font
  return  TextStyle(
    // set color of text
      color: colorText,
      // set the font family as defined in pubspec.yaml
      fontFamily: fontFamilyFont,
      // set the font weight
      fontWeight: fontWeightFont,
      // set the font size
      fontSize: fontSizeFont.toDouble());
}


void changeNotificationBarColorIcon({
  required bool isLight,
  navigationBarColor = white,
  statusBarColor = Colors.transparent,
}) {
  var brightness = isLight ? Brightness.light : Brightness.dark;
  Future.delayed(const Duration(milliseconds: 1)).then(
        (value) => SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: statusBarColor,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
      ),
    ),
  );
}