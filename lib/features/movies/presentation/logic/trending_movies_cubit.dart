import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/time_window.dart';
import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';

part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit({required this.getMoviesUsecase}) : super(const TrendingMoviesState());

  final GetMoviesUsecase getMoviesUsecase;

  Future<void> fetchTrendingMovies({TimeWindow timeWindow = TimeWindow.day}) async {
    emit(state.copyWith(status: UsecaseStatus.loading));
    final result = await getMoviesUsecase(ApiConstants.endPoints.TRENDING_MOVIES(timeWindow));
    result.fold(
      (failure) => emit(state.copyWith(status: UsecaseStatus.failure, error: failure.response)),
      (movies) => emit(state.copyWith(status: UsecaseStatus.success, movies: movies)),
    );
  }
}
