import 'dart:ui';

import 'package:cinemahub/core/widgets/app_cached_network_image.dart';
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
            child: AppCachedNetworkImage(imageUrl: movie.fullBackdropPath, fit: BoxFit.cover),
          ),
          Hero(
            tag: movie.id,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
              child: AppCachedNetworkImage(imageUrl: movie.fullPosterPath, width: 160.w, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
