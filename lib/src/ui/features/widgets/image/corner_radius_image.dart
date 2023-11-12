import 'package:flutter/material.dart';

import '../../../../config/resources/image_routes.dart';
import 'custom_network_image.dart';

class CornerRadiusImage extends StatelessWidget {
  const CornerRadiusImage({
    Key? key,
    this.corner = 0,
    this.imageUrl,
    this.placeholder = newPlaceHolderImage,
    this.isAllCorner = true,
    this.cornerTopLeft = 0,
    this.cornerBottomLeft = 0,
    this.cornerTopEnd = 0,
    this.cornerBottomEnd = 0,
    this.boxFit = BoxFit.cover,
    this.width,
    this.height,
  }): super(key: key);

  final double corner;
  final double? cornerTopLeft;
  final double? cornerBottomLeft;
  final double? cornerTopEnd;
  final double? cornerBottomEnd;
  final String? imageUrl;
  final String? placeholder;
  final bool? isAllCorner;
  final BoxFit boxFit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final imageAsset = Image.asset(placeholder!, fit: BoxFit.cover);
    return ClipRRect(
      borderRadius: getCornerRadius(),
      child: imageUrl == null
          ? imageAsset
          : CustomNetworkImage(
        fit: boxFit,
        placeholder: (context, uri) => Container(color: Colors.grey.shade300),
        imageUrl: imageUrl!,
        width: width,
        height: height,
      ),
    );
  }

  BorderRadius getCornerRadius() {
    if (isAllCorner == true) {
      return BorderRadius.all(Radius.circular(corner));
    } else {
      return BorderRadius.only(
        topLeft: Radius.circular(cornerTopLeft ?? corner),
        topRight: Radius.circular(cornerTopEnd ?? corner),
        bottomLeft: Radius.circular(cornerBottomLeft ?? corner),
        bottomRight: Radius.circular(cornerBottomEnd ?? corner),
      );
    }
  }
}
