import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/resources/colors.dart';

class SkeletonLoaderContainer extends StatelessWidget {
  const SkeletonLoaderContainer(
      this.child, {Key? key,
        this.isLoading = true,
        this.enabled = true,
      }) : super(key: key);

  final Widget child;
  final bool isLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) => isLoading
      ? Shimmer.fromColors(
    baseColor: skelotonGray,
    highlightColor: soap300,
    enabled: enabled,
    child: child,
  )
      : child;
}

// This container is used for skeleton loader effect
class SkeletonLoaderUtils {
  static Widget container(
      Widget child, {
        bool isLoading = true,
        double borderRadius = 8.0
      }) =>
      Container(
        decoration: BoxDecoration(
          color: isLoading ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        child: child,
      );
}