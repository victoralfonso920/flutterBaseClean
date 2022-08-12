import 'package:flutter/material.dart';
import 'package:clean_core/src/tools/utils_widgets.dart' as utils;

class GenericLabel extends StatelessWidget {
    const GenericLabel(
      { required this.label, this.style, this.lines = 1});

  final String label;
  final TextStyle? style ;
  final int? lines;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      overflow: TextOverflow.ellipsis,
      style: style ?? utils.getCustomFontTextStyle(),
      maxLines: lines,
    );
  }
}
