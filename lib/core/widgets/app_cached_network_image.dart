import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_constants.dart';
import '../extensions/context.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({super.key, required this.imageUrl, this.width, this.height, this.fit = BoxFit.cover, this.radius = AppConstants.radius});

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator.adaptive(value: progress.progress)),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.radius.r),
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
          child: Icon(Icons.warning_amber, size: 40.sp, color: Colors.redAccent),
        ),
      ),
    );
  }
}
