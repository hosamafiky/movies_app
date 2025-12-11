import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../domain/entities/tv_show.dart';

class TVShowListWidget extends StatelessWidget {
  const TVShowListWidget(this.tvShow, {super.key});

  final TVShow tvShow;

  @override
  Widget build(BuildContext context) {
    final palette = context.watchPalette;
    final styles = context.watchTextStyles;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 160.w),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(color: palette.bottomNavigationUnselected, borderRadius: BorderRadius.circular(AppConstants.radius)),
              child: CachedNetworkImage(
                width: 160.w,
                fit: BoxFit.cover,
                height: 213.h,
                imageUrl: tvShow.fullPosterPath,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.radius),
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator.adaptive(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.radius),
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
            ),
          ),
          Text(tvShow.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: styles.title1Style),
        ],
      ),
    );
  }
}
