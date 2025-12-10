import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/movie.dart';

class MovieGridWidget extends StatelessWidget {
  const MovieGridWidget(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // final palette = context.watch<ThemeCubit>().state.palette;
    // final styles = TextStyles(palette);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 160.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          width: 160.w,
          fit: BoxFit.cover,
          height: 213.h,
          imageUrl: movie.fullPosterPath,
          progressIndicatorBuilder: (context, url, progress) {
            return Center(child: CircularProgressIndicator.adaptive(value: progress.progress));
          },
          errorWidget: (context, url, error) {
            return const Center(child: Icon(Icons.error, color: Colors.redAccent));
          },
        ),
      ),
    );
  }
}
