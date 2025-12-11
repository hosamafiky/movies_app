import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit({required this.getMoviesUsecase}) : super(const NowPlayingMoviesState());

  final GetMoviesUsecase getMoviesUsecase;

  Future<void> fetchNowPlayingMovies() async {
    emit(state.copyWith(status: UsecaseStatus.loading));
    final result = await getMoviesUsecase(ApiConstants.endPoints.NOW_PLAYING_MOVIES);
    result.fold(
      (failure) => emit(state.copyWith(status: UsecaseStatus.failure, error: failure.response)),
      (movies) => emit(state.copyWith(status: UsecaseStatus.success, movies: movies)),
    );
  }
}
