import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

import '../../../core/enums/usecase_status.dart';
import '../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.getNowPlayingMoviesUsecase, required this.getPopularMoviesUsecase, required this.getTopRatedMoviesUsecase}) : super(MoviesState());

  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  Future<void> fetchNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingStatus: UsecaseStatus.loading));

    final result = await getNowPlayingMoviesUsecase();

    result.fold(
      (failure) => emit(state.copyWith(nowPlayingStatus: UsecaseStatus.failure, nowPlayingError: failure.response)),
      (movies) => emit(state.copyWith(nowPlayingStatus: UsecaseStatus.success, nowPlayingMovies: movies)),
    );
  }

  Future<void> fetchPopularMovies() async {
    emit(state.copyWith(popularStatus: UsecaseStatus.loading));

    final result = await getPopularMoviesUsecase();

    result.fold(
      (failure) => emit(state.copyWith(popularStatus: UsecaseStatus.failure, popularError: failure.response)),
      (movies) => emit(state.copyWith(popularStatus: UsecaseStatus.success, popularMovies: movies)),
    );
  }

  Future<void> fetchTopRatedMovies() async {
    emit(state.copyWith(topRatedStatus: UsecaseStatus.loading));

    final result = await getTopRatedMoviesUsecase();

    result.fold(
      (failure) => emit(state.copyWith(topRatedStatus: UsecaseStatus.failure, topRatedError: failure.response)),
      (movies) => emit(state.copyWith(topRatedStatus: UsecaseStatus.success, topRatedMovies: movies)),
    );
  }
}
