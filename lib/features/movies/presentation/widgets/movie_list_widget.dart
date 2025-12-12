import 'package:cinemahub/core/extensions/context.dart';
import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
import 'package:cinemahub/features/movies/presentation/pages/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/movie.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget(this.movie, {super.key, this.showYear = false});

  final Movie movie;
  final bool showYear;

  @override
  Widget build(BuildContext context) {
    final styles = context.watchTextStyles;
    return InkWell(
      onTap: () => context.to(MovieDetailsPage(movie)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 160.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppCachedNetworkImage(width: 160.w, fit: BoxFit.cover, height: 213.h, imageUrl: movie.fullPosterPath ?? movie.fullBackdropPath ?? ''),
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
