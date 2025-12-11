import 'package:cinemahub/core/extensions/context.dart';
import 'package:cinemahub/core/widgets/horizontal_list_view.dart';
import 'package:cinemahub/features/movies/domain/entities/actor.dart';
import 'package:cinemahub/features/movies/domain/entities/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/trailer.dart';
import '../logic/movie_details_cubit.dart';
import '../widgets/actor_widget.dart';
import '../widgets/movie_genres.dart';
import '../widgets/movie_header.dart';
import '../widgets/movie_list_widget.dart';
import '../widgets/trailer_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjector.instance.sl<MovieDetailsCubit>()
        ..fetchMovieDetails(movie.id)
        ..fetchMovieCast(movie.id)
        ..fetchMovieTrailers(movie.id)
        ..fetchSimilarMovies(movie.id)
        ..fetchMovieRecommendations(movie.id),
      lazy: false,
      child: Scaffold(body: MovieDetailsBody(movie)),
    );
  }
}

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final styles = context.watchTextStyles;
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50.h),
        child: BlocSelector<MovieDetailsCubit, MovieDetailsState, Movie>(
          selector: (state) => state.movieDetails ?? movie,
          builder: (context, movie) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieHeader(movie),
                if (movie is MovieDetails) MovieGenresWidget(movie),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      child: Text('Overview', style: styles.heading1Style),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(movie.overview, style: styles.body2Style),
                    ),
                  ],
                ),
                HorizontalListView<MovieDetailsCubit, MovieDetailsState, Actor>(
                  dataSelector: (state) => (status: state.castStatus, error: state.castError, items: state.cast),
                  sectionTitle: "Cast",
                  listHeight: 230.h,
                  listSeparation: 32.w,
                  itemBuilder: (item) => ActorWidget(item),
                ),
                HorizontalListView<MovieDetailsCubit, MovieDetailsState, Trailer>(
                  dataSelector: (state) => (status: state.trailersStatus, error: state.trailersError, items: state.trailers),
                  sectionTitle: "Trailers",
                  listHeight: 203.h,
                  itemBuilder: (item) => TrailerWidget(item),
                ),
                HorizontalListView<MovieDetailsCubit, MovieDetailsState, Movie>(
                  dataSelector: (state) => (status: state.similarStatus, error: state.similarError, items: state.similarMovies),
                  sectionTitle: "Similar Movies",
                  itemBuilder: (item) => MovieListWidget(item, showYear: true),
                ),
                HorizontalListView<MovieDetailsCubit, MovieDetailsState, Movie>(
                  dataSelector: (state) => (status: state.recommendationsStatus, error: state.recommendationsError, items: state.recommendationsMovies),
                  sectionTitle: "Recommendations",
                  itemBuilder: (item) => MovieListWidget(item, showYear: true),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
