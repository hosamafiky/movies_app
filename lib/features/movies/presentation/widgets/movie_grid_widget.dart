import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context.dart';
import '../../../../core/widgets/skeleton_wrapper.dart';
import '../../domain/entities/movie.dart';
import '../pages/movie_details_screen.dart';

class MovieGridWidget extends StatelessWidget {
  const MovieGridWidget(this.movie, {super.key}) : _isSkeleton = false;

  MovieGridWidget.skeleton({super.key}) : movie = Movie.empty(), _isSkeleton = true;

  final Movie movie;

  final bool _isSkeleton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!_isSkeleton) {
          context.to(MovieDetailsPage(movie));
        }
      },
      child: SkeletonWrapper(
        enabled: _isSkeleton,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 160.w),
          child: Hero(
            tag: movie.id,
            child: AppCachedNetworkImage(isSkeleton: _isSkeleton, imageUrl: movie.fullPosterPath, width: 160.w, height: 213.h, radius: 16.r, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
