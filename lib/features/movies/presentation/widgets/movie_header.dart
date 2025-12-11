import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/movie.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(movie.fullBackdropPath), fit: BoxFit.cover),
              ),
            ),
          ),
          Hero(
            tag: movie.id,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(movie.fullPosterPath, fit: BoxFit.cover, width: 160.w),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
