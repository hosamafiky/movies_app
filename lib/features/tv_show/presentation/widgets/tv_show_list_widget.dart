import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
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
              decoration: BoxDecoration(color: palette.bottomNavigationUnselected, borderRadius: BorderRadius.circular(AppConstants.radius.r)),
              child: AppCachedNetworkImage(width: 160.w, fit: BoxFit.cover, height: 213.h, imageUrl: tvShow.fullPosterPath),
            ),
          ),
          Text(tvShow.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: styles.title1Style),
        ],
      ),
    );
  }
}
