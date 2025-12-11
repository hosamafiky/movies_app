import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinemahub/core/extensions/context.dart';
import 'package:cinemahub/features/movies/presentation/pages/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_constants.dart';
import '../../domain/entities/movie.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget(this.movie, {super.key, this.showYear = false});

  final Movie movie;
  final bool showYear;

  @override
  Widget build(BuildContext context) {
    final styles = context.watchTextStyles;
    if (movie.fullPosterPath == null && movie.fullBackdropPath == null) {
      print('MovieListWidget: Both posterPath and backdropPath are null for movie id: ${movie.title}');
    }
    return InkWell(
      onTap: () => context.to(MovieDetailsPage(movie)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 160.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                width: 160.w,
                fit: BoxFit.cover,
                height: 213.h,
                imageUrl: movie.fullPosterPath ?? movie.fullBackdropPath ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.radius),
                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator.adaptive(value: progress.progress)),
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
            SizedBox(height: 16.h),
            Text(movie.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: styles.title1Style),
            if (showYear && movie.releaseDate.isNotEmpty) Text(DateFormat('yyyy-MM-dd').parse(movie.releaseDate).year.toString(), style: styles.body1Style),
          ],
        ),
      ),
    );
  }
}
