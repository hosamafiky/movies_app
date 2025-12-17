import 'package:cinemahub/core/extensions/context.dart';
import 'package:cinemahub/core/extensions/duration.dart';
import 'package:cinemahub/core/widgets/horizontal_list_view.dart';
import 'package:cinemahub/features/movies/domain/entities/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../../cast/domain/usecases/get_cast_usecase.dart';
import '../../../cast/presentation/cubit/cast_cubit.dart';
import '../../../cast/presentation/widgets/actors_list_widget.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/trailer.dart';
import '../logic/movie_details_cubit.dart';
import '../logic/movie_details_state.dart';
import '../widgets/movie_genres.dart';
import '../widgets/movie_header.dart';
import '../widgets/movie_list_widget.dart';
import '../widgets/reviews_section.dart';
import '../widgets/trailer_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DependencyInjector.instance.sl<MovieDetailsCubit>()
            ..fetchMovieDetails(movie.id)
            ..fetchMovieTrailers(movie.id)
            ..fetchSimilarMovies(movie.id)
            ..fetchMovieRecommendations(movie.id),
          lazy: false,
        ),
        BlocProvider(create: (context) => DependencyInjector.instance.sl<CastCubit>()..fetchCast(GetCastParams(id: movie.id))),
      ],
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
      appBar: AppBar(),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Text((movie is MovieDetails ? movie.runtime.toDuration : Duration.zero).hoursAndMinutes),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Row(mainAxisAlignment: .spaceBetween, children: [const Text('Release Date: '), Text(movie.releaseDate)]),
                ),
                MovieReviewsSection(movie),
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
                const ActorsListWidget(),
                HorizontalListView<MovieDetailsCubit, MovieDetailsState, Trailer>(
                  mapState: (state) => (status: state.trailersStatus, error: state.trailersError, items: state.trailers),
                  sectionTitle: "Trailers",
                  height: 203.h,
                  itemBuilder: (item) => TrailerWidget(item),
                  skeleton: TrailerWidget.skeleton(),
                ),
                HorizontalListView<MovieDetailsCubit, MovieDetailsState, Movie>(
                  mapState: (state) => (status: state.similarStatus, error: state.similarError, items: state.similarMovies),
                  sectionTitle: "Similar Movies",
                  itemBuilder: (item) => MovieListWidget(item, showYear: true),
                  skeleton: const MovieListWidget.skeleton(),
                ),

                HorizontalListView<MovieDetailsCubit, MovieDetailsState, Movie>(
                  mapState: (state) => (status: state.recommendationsStatus, error: state.recommendationsError, items: state.recommendationsMovies),
                  sectionTitle: "Recommendations",
                  itemBuilder: (item) => MovieListWidget(item, showYear: true),
                  skeleton: const MovieListWidget.skeleton(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
