// ignore_for_file: use_named_constants

import 'package:flutter/widgets.dart';

import '../../tools/utils.dart';

class GenericLabel extends StatelessWidget {
  const GenericLabel({
    Key? key,
    required this.label,
    this.style,
    this.lines = 1,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  final String label;
  final TextStyle? style;
  final int? lines;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final bool softWrap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Text(
        label,
        overflow: overflow,
        softWrap: softWrap,
        style: style ?? getCustomFontTextStyle(),
        maxLines: lines,
        textAlign: textAlign,
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
