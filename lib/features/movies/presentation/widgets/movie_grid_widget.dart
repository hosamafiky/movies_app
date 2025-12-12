import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
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
        child: Hero(
          tag: movie.id,
          child: AppCachedNetworkImage(radius: 16.r, width: 160.w, fit: BoxFit.cover, height: 213.h, imageUrl: movie.fullPosterPath ?? movie.fullBackdropPath!),
        ),
      ),
    );
  }
}
