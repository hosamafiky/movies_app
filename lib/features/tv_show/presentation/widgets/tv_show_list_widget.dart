import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

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
              decoration: BoxDecoration(color: palette.bottomNavigationUnselected, borderRadius: BorderRadius.circular(8.r)),
              child: CachedNetworkImage(
                width: 160.w,
                fit: BoxFit.cover,
                height: 213.h,
                imageUrl: tvShow.fullPosterPath,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    height: 213.h,
                    width: 160.w,
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error, size: 40),
              ),
            ),
          ),
          Text(tvShow.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: styles.title1Style),
        ],
      ),
    );
  }
}
