import 'package:cinemahub/core/extensions/context.dart';
import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
import 'package:cinemahub/core/widgets/skeleton_wrapper.dart';
import 'package:cinemahub/features/movies/presentation/pages/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/movie.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget(this.movie, {super.key, this.showYear = false}) : _isSkeleton = false;

  const MovieListWidget.skeleton({super.key}) : movie = const Movie(), showYear = false, _isSkeleton = true;

  final Movie movie;
  final bool showYear;

  /// Is a skeleton widget
  final bool _isSkeleton;

  @override
  Widget build(BuildContext context) {
    final styles = context.watchTextStyles;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppCachedNetworkImage(isSkeleton: _isSkeleton, imageUrl: movie.fullPosterPath, width: 160.w, height: 213.h, fit: BoxFit.cover),
              ),
              SizedBox(height: 16.h),
              Text(movie.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: styles.title1Style),
              if (showYear && movie.releaseDate.isNotEmpty) Text(_extractYear(movie.releaseDate), style: styles.body1Style),
            ],
          ),
        ),
      ),
    );
  }

  String _extractYear(String dateString) {
    try {
      return DateFormat('yyyy-MM-dd').parse(dateString).year.toString();
    } catch (e) {
      return dateString.split('-').first;
    }
  }
}
