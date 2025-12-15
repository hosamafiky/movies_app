import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
import 'package:cinemahub/core/widgets/skeleton_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context.dart';
import '../../domain/entities/tv_show.dart';

class TVShowListWidget extends StatelessWidget {
  const TVShowListWidget(this.tvShow, {super.key}) : _isSkeleton = false;

  TVShowListWidget.skeleton({super.key}) : tvShow = TVShow.empty(), _isSkeleton = true;

  final TVShow tvShow;

  final bool _isSkeleton;

  @override
  Widget build(BuildContext context) {
    final styles = context.watchTextStyles;
    return SkeletonWrapper(
      enabled: _isSkeleton,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 160.w),
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppCachedNetworkImage(isSkeleton: _isSkeleton, imageUrl: tvShow.fullPosterPath, width: 160.w, height: 213.h, fit: BoxFit.cover),
            ),
            Text(tvShow.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: styles.title1Style),
          ],
        ),
      ),
    );
  }
}
