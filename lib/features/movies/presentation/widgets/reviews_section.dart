import 'package:cinemahub/core/enums/usecase_status.dart';
import 'package:cinemahub/core/networking/interface/error_response.dart';
import 'package:cinemahub/features/movies/domain/entities/movie.dart';
import 'package:cinemahub/features/movies/presentation/logic/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/context.dart';
import '../logic/movie_details_state.dart';

class MovieReviewsSection extends StatelessWidget {
  const MovieReviewsSection(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieDetailsCubit, MovieDetailsState, ({UsecaseStatus status, ErrorResponse? failure, Movie movie})>(
      selector: (state) => (status: state.movieDetailsStatus, failure: state.movieDetailsError, movie: state.movieDetails ?? movie),
      builder: (context, state) {
        print("The vote average is ${state.movie.voteAverage}");
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Column(
              spacing: 8.h,
              children: [
                Text(
                  state.movie.voteAverage.toStringAsFixed(1),
                  style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold),
                ),
                RatingStars(state.movie.voteAverage, size: 28.w, mainAxisAlignment: .center),
                Text('${state.movie.voteCount} Reviews\n(based on TMDB user reviews)', textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RatingStars extends StatelessWidget {
  const RatingStars(this.vote, {super.key, this.size = 24, this.mainAxisAlignment = MainAxisAlignment.start});

  final double vote, size;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final palette = context.watchPalette;
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: List.generate(5, (index) {
        final starFill = vote - index;
        if (starFill >= 1) {
          return Icon(Icons.star, size: size, color: palette.progressIndicator);
        } else if (starFill > 0) {
          return Icon(Icons.star_half, size: size, color: palette.progressIndicator);
        } else {
          return Icon(Icons.star_border, size: size, color: palette.progressIndicator);
        }
      }),
    );
  }
}
