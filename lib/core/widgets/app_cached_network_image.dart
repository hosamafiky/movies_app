import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../app_constants.dart';
import '../extensions/context.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.radius = AppConstants.radius,
    this.isSkeleton = false,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double radius;

  final bool isSkeleton;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: isSkeleton
          ? Skeleton.shade(
              shade: true,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.r), color: Colors.grey[300]),
              ),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl,
              width: width,
              height: height,
              fit: fit,
              placeholder: (context, url) => Skeletonizer(
                enabled: true,
                effect: PulseEffect(from: context.watchPalette.shimmerBase, to: context.watchPalette.shimmerHighlight),
                child: Skeleton.shade(
                  shade: true,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius.r), color: Colors.grey[300]),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      context.watchPalette.bottomNavigationUnselected.withValues(alpha: 0.5),
                      context.watchPalette.bottomNavigationUnselected.withValues(alpha: 0.7),
                      context.watchPalette.bottomNavigationUnselected.withValues(alpha: 0.5),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(Icons.warning_amber, size: 40.sp, color: Colors.redAccent),
                ),
              ),
            ),
    );
  }
}
