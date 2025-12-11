import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_constants.dart';
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
            child: CachedNetworkImage(imageUrl: movie.fullBackdropPath!, fit: BoxFit.cover),
          ),
          Hero(
            tag: movie.id,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.radius),
                child: CachedNetworkImage(imageUrl: movie.fullPosterPath ?? movie.fullBackdropPath!, width: 160.w, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
