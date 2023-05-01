import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../tools/const.dart';


const defaultLetterSpacing = 0.2;

ThemeData appThemeData(context) => ThemeData(
    primaryColor: generalBlack,
    splashColor: generalBlack,
    highlightColor: carbon50,
    scaffoldBackgroundColor: backgroundSecondary,
    fontFamily: gothamFontFamily,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    textSelectionTheme:
    const TextSelectionThemeData(cursorColor: secondary500),
    textTheme: TextTheme(
      displayLarge: Theme.of(context)
          .textTheme
          .displayLarge!
          .copyWith(letterSpacing: defaultLetterSpacing),
      displayMedium: Theme.of(context)
          .textTheme
          .displayMedium!
          .copyWith(letterSpacing: defaultLetterSpacing),
      displaySmall: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(letterSpacing: defaultLetterSpacing),
      headlineMedium: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(letterSpacing: defaultLetterSpacing),
      titleLarge: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(letterSpacing: defaultLetterSpacing),
      titleMedium: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(letterSpacing: defaultLetterSpacing),
      titleSmall: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(letterSpacing: defaultLetterSpacing),
      bodyLarge: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(letterSpacing: defaultLetterSpacing),
      bodyMedium: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(letterSpacing: defaultLetterSpacing),
      labelLarge: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(letterSpacing: defaultLetterSpacing),
      bodySmall: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(letterSpacing: defaultLetterSpacing),
      labelSmall: Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(letterSpacing: defaultLetterSpacing),
    ));
