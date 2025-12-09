import 'package:cinemahub/core/enums/time_window.dart';
import 'package:cinemahub/core/networking/api_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movie_recommendations_usecase.dart';
import '../../domain/usecases/get_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.getMoviesUsecase, required this.getMovieDetailsUsecase, required this.getMovieRecommendationsUsecase}) : super(MoviesState());

  final GetMoviesUsecase getMoviesUsecase;
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMovieRecommendationsUsecase getMovieRecommendationsUsecase;

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

  Future<void> fetchMoviesByGenre(int genreId) async {
    emit(state.copyWith(genreStatus: UsecaseStatus.loading));

    final result = await getMoviesUsecase(ApiConstants.endPoints.DISCOVER_MOVIES, queryParameters: {'with_genres': genreId});

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

  Future<void> fetchMovieRecommendations(int id) async {
    emit(state.copyWith(recommendationsStatus: UsecaseStatus.loading));

    final result = await getMovieRecommendationsUsecase(id);

    result.fold(
      (failure) => emit(state.copyWith(recommendationsStatus: UsecaseStatus.failure, recommendationsError: failure.response)),
      (movies) => emit(state.copyWith(recommendationsStatus: UsecaseStatus.success, recommendationsMovies: movies)),
    );
  }
}
