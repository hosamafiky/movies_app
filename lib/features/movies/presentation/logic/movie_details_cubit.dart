import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/actor.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/trailer.dart';
import '../../domain/usecases/get_movie_cast_usecase.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movie_trailers_usecase.dart';
import '../../domain/usecases/get_movies_usecase.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit({
    required this.getMovieDetailsUsecase,
    required this.getMovieCastUsecase,
    required this.getMovieTrailersUsecase,
    required this.getMoviesUsecase,
  }) : super(const MovieDetailsState());

  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMovieCastUsecase getMovieCastUsecase;
  final GetMovieTrailersUsecase getMovieTrailersUsecase;
  final GetMoviesUsecase getMoviesUsecase;

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
