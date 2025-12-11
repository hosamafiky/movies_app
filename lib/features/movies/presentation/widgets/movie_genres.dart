import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';

class MovieGenresWidget extends StatelessWidget {
  const MovieGenresWidget(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Wrap(
        spacing: 12.w,
        runSpacing: 0.h,
        children: (movie as MovieDetails).genres.map((genre) => Chip(label: Text(genre.name))).toList(),
      ),
    );
  }
}
