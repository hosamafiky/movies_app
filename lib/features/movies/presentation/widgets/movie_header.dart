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
          Positioned(
            bottom: 0.h,
            left: 0.w,
            right: 0.w,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(8.r)),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
