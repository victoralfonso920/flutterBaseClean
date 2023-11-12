import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/resources/colors.dart';
import '../../../../config/resources/image_routes.dart';


class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final Color? color;
  final BlendMode? colorBlendMode;
  final BoxFit fit;
  final PlaceholderWidgetBuilder? placeholder;

  const CustomNetworkImage(
      {Key? key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit = BoxFit.contain,
      this.placeholder,
      this.color,
      this.colorBlendMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      placeholder: placeholder,
      color: color,
      colorBlendMode: colorBlendMode,
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SvgPicture.asset(
          newPlaceHolderImage,
          fit: BoxFit.contain,
          theme: const SvgTheme(currentColor: selago),
        ),
      ),
    );
  }
}
