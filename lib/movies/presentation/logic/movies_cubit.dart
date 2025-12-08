import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';

import '../../../core/enums/usecase_status.dart';
import '../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.getNowPlayingMoviesUsecase}) : super(MoviesState());

  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;

  Future<void> fetchNowPlayingMovies() async {
    emit(state.copyWith(nowPlayingStatus: UsecaseStatus.loading));

    final result = await getNowPlayingMoviesUsecase();

    result.fold(
      (failure) => emit(state.copyWith(nowPlayingStatus: UsecaseStatus.failure, nowPlayingError: failure.response)),
      (movies) => emit(state.copyWith(nowPlayingStatus: UsecaseStatus.success, nowPlayingMovies: movies)),
    );
  }
}
