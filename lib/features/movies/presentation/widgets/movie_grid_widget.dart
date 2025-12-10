import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context.dart';
import '../../domain/entities/movie.dart';
import '../pages/movie_details_screen.dart';

class MovieGridWidget extends StatelessWidget {
  const MovieGridWidget(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.to(MovieDetailsPage(movie)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 160.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Hero(
            tag: movie.id,
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
        ),
      ),
    );
  }
}
