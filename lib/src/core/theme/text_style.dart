import 'package:flutter/material.dart';

const fontBlack = FontWeight.w900;
const fontUltra = FontWeight.w800;
const fontBold = FontWeight.w700;
const fontMedium =  FontWeight.w500;
const fontRegular =  FontWeight.w400;
const fontLight = FontWeight.w300;

/// FontWeight.w800.
TextStyle fontBlackSize(double size) => TextStyle(
  fontSize: size,
  fontWeight: fontBlack,
  color: Colors.black,
);

/// FontWeight.w700.
TextStyle fontBoldSize(double size) => TextStyle(
  fontSize: size,
  fontWeight: fontBold,
  color: Colors.black,
);

/// FontWeight.w500.
TextStyle fontMediumSize(double size) => TextStyle(
  fontSize: size,
  fontWeight: fontMedium,
  color: Colors.black,
);

/// FontWeight.w400.
TextStyle fontRegularSize(double size) => TextStyle(
  fontSize: size,
  fontWeight: fontRegular,
  color: Colors.black,
);

/// FontWeight.w300.
TextStyle fontLightSize(double size) => TextStyle(
  fontSize: size,
  fontWeight: fontLight,
  color: Colors.black,
);



