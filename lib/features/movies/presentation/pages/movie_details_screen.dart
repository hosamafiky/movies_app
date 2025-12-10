import 'dart:ui';

import 'package:cinemahub/core/widgets/horizontal_list_view.dart';
import 'package:cinemahub/features/movies/domain/entities/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/dependency_injection/di.dart';
import '../../domain/entities/movie.dart';
import '../logic/movies_cubit.dart';
import '../widgets/movie_list_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyInjector.instance.sl<MoviesCubit>()
        ..fetchMovieDetails(movie.id)
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
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title, style: GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50.h),
        child: BlocSelector<MoviesCubit, MoviesState, Movie>(
          selector: (state) => state.movieDetails ?? movie,
          builder: (context, movie) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
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
                ),
                if (movie is MovieDetails) _MovieGenresWidget(movie),
                HorizontalListView<MoviesCubit, MoviesState, Movie>(
                  dataSelector: (state) => (status: state.recommendationsStatus, error: state.recommendationsError, items: state.recommendationsMovies),
                  sectionTitle: "Recommendations",
                  itemBuilder: (item) => MovieListWidget(item),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _MovieGenresWidget extends StatelessWidget {
  const _MovieGenresWidget(this.movie);

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
