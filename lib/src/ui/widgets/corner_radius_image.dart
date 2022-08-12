import 'package:flutter/material.dart';

import '../../tools/resources/image_rutes.dart';

class CornerRadiusImage extends StatelessWidget {
  const CornerRadiusImage({
    this.corner = 0,
    this.imageUrl,
    this.placeholder = newPlaceHolderImage,
    this.isAllCorner = true,
    this.cornerTopLeft = 0,
    this.cornerBottomLeft = 0,
    this.cornerTopEnd = 0,
    this.cornerBottomEnd = 0,
  });

  final double corner;
  final double? cornerTopLeft;
  final double? cornerBottomLeft;
  final double? cornerTopEnd;
  final double? cornerBottomEnd;
  final String? imageUrl;
  final String? placeholder;
  final bool? isAllCorner;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: getCornerRadius(),
      child: imageUrl == null
          ? Image.asset(
              placeholder!,
              fit: BoxFit.cover,
            )
          : FadeInImage.assetNetwork(
        fit: BoxFit.cover,
        placeholder: placeholder!,
        image: imageUrl!,
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
