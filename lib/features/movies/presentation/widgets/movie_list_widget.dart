import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/styles/text_styles.dart';
import '../../../theme/presentation/cubit/theme_cubit.dart';
import '../../domain/entities/movie.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<ThemeCubit>().state.palette;
    final styles = TextStyles(palette);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 160.w),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: CachedNetworkImage(
                width: 160.w,
                fit: BoxFit.cover,
                height: 213.h,
                imageUrl: movie.fullPosterPath,
                progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator.adaptive(value: progress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Text(movie.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: styles.title1Style),
        ],
      ),
    );
  }
}
