import 'package:cinemahub/core/enums/time_window.dart';
import 'package:cinemahub/core/networking/api_constants.dart';
import 'package:cinemahub/features/movies/domain/usecases/get_movie_trailers_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/actor.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/trailer.dart';
import '../../domain/usecases/get_movie_cast_usecase.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.getMoviesUsecase, required this.getMovieDetailsUsecase, required this.getMovieTrailersUsecase, required this.getMovieCastUsecase})
    : super(MoviesState());

  final GetMoviesUsecase getMoviesUsecase;
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMovieTrailersUsecase getMovieTrailersUsecase;
  final GetMovieCastUsecase getMovieCastUsecase;

  Future<void> fetchNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingStatus: UsecaseStatus.loading));
    final result = await getMoviesUsecase(ApiConstants.endPoints.NOW_PLAYING_MOVIES);
    result.fold(
      (failure) => emit(state.copyWith(nowPlayingStatus: UsecaseStatus.failure, nowPlayingError: failure.response)),
      (movies) => emit(state.copyWith(nowPlayingStatus: UsecaseStatus.success, nowPlayingMovies: movies)),
    );
  }

  Future<void> fetchPopularMovies() async {
    emit(state.copyWith(popularStatus: UsecaseStatus.loading));
    final result = await getMoviesUsecase(ApiConstants.endPoints.POPULAR_MOVIES);
    result.fold(
      (failure) => emit(state.copyWith(popularStatus: UsecaseStatus.failure, popularError: failure.response)),
      (movies) => emit(state.copyWith(popularStatus: UsecaseStatus.success, popularMovies: movies)),
    );
  }

  Future<void> fetchTrendingMovies({TimeWindow timeWindow = TimeWindow.day}) async {
    emit(state.copyWith(trendingStatus: UsecaseStatus.loading));
    final result = await getMoviesUsecase(ApiConstants.endPoints.TRENDING_MOVIES(timeWindow));
    result.fold(
      (failure) => emit(state.copyWith(trendingStatus: UsecaseStatus.failure, trendingError: failure.response)),
      (movies) => emit(state.copyWith(trendingStatus: UsecaseStatus.success, trendingMovies: movies)),
    );
  }

  Future<void> fetchFilteredMovies(int? genreId, String? sortBy) async {
    emit(state.copyWith(genreStatus: UsecaseStatus.loading));
    final result = await getMoviesUsecase(
      ApiConstants.endPoints.DISCOVER_MOVIES,
      queryParameters: {'with_genres': genreId, 'sort_by': sortBy}..removeWhere((key, value) => value == null),
    );
    result.fold(
      (failure) => emit(state.copyWith(genreStatus: UsecaseStatus.failure, genreError: failure.response)),
      (movies) => emit(state.copyWith(genreStatus: UsecaseStatus.success, genreMovies: movies)),
    );
  }

  Future<void> fetchMovieDetails(int id) async {
    emit(state.copyWith(movieDetailsStatus: UsecaseStatus.loading));
    final result = await getMovieDetailsUsecase(id);
    result.fold(
      (failure) => emit(state.copyWith(movieDetailsStatus: UsecaseStatus.failure, movieDetailsError: failure.response)),
      (movieDetails) => emit(state.copyWith(movieDetailsStatus: UsecaseStatus.success, movieDetails: movieDetails)),
    );
  }

  Future<void> fetchMovieCast(int id) async {
    emit(state.copyWith(castStatus: UsecaseStatus.loading));
    final result = await getMovieCastUsecase(id);
    result.fold(
      (failure) => emit(state.copyWith(castStatus: UsecaseStatus.failure, castError: failure.response)),
      (cast) => emit(state.copyWith(castStatus: UsecaseStatus.success, cast: cast)),
    );
  }

  Future<void> fetchMovieTrailers(int id) async {
    emit(state.copyWith(trailersStatus: UsecaseStatus.loading));
    final result = await getMovieTrailersUsecase(id);
    result.fold(
      (failure) => emit(state.copyWith(trailersStatus: UsecaseStatus.failure, trailersError: failure.response)),
      (trailers) => emit(state.copyWith(trailersStatus: UsecaseStatus.success, trailers: trailers)),
    );
  }

  Future<void> fetchSimilarMovies(int id) async {
    emit(state.copyWith(similarStatus: UsecaseStatus.loading));
    final result = await getMoviesUsecase(ApiConstants.endPoints.SIMILAR_MOVIES(id));
    result.fold(
      (failure) => emit(state.copyWith(similarStatus: UsecaseStatus.failure, similarError: failure.response)),
      (movies) => emit(state.copyWith(similarStatus: UsecaseStatus.success, similarMovies: movies)),
    );
  }

  Future<void> fetchMovieRecommendations(int id) async {
    emit(state.copyWith(recommendationsStatus: UsecaseStatus.loading));
    final result = await getMoviesUsecase(ApiConstants.endPoints.RECOMMENDATIONS(id));
    result.fold(
      (failure) => emit(state.copyWith(recommendationsStatus: UsecaseStatus.failure, recommendationsError: failure.response)),
      (movies) => emit(state.copyWith(recommendationsStatus: UsecaseStatus.success, recommendationsMovies: movies)),
    );
  }
}
