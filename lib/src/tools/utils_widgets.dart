import 'package:flutter/material.dart';
import 'const.dart';

TextStyle getCustomFontTextStyle(
    {colorText = Colors.blueAccent,
      fontFamilyFont= gothamFontFamily,
      fontWeightFont = FontWeight.w400,
      fontSizeFont = 12.0}
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
