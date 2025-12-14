import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/extensions/context.dart';
import '../../domain/entities/movie.dart';
import '../pages/movie_details_screen.dart';

class MovieGridWidget extends StatelessWidget {
  const MovieGridWidget(this.movie, {super.key}) : _isSkeleton = false;

  MovieGridWidget.skeleton({super.key}) : movie = Movie.empty(), _isSkeleton = true;

  final Movie movie;
  final bool _isSkeleton;

  @override
  Widget build(BuildContext context) {
    return Skeleton.shade(
      shade: _isSkeleton,
      child: InkWell(
        onTap: () => context.to(MovieDetailsPage(movie)),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 160.w),
          child: Hero(
            tag: movie.id,
            child: _isSkeleton
                ? Container(
                    decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(16.r)),
                    width: 160.w,
                    height: 213.h,
                  )
                : AppCachedNetworkImage(
                    radius: 16.r,
                    width: 160.w,
                    fit: BoxFit.cover,
                    height: 213.h,
                    imageUrl: movie.fullPosterPath ?? movie.fullBackdropPath!,
                  ),
          ),
        ),
      ),
    );
  }
}
