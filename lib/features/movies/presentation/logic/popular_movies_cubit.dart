import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit({required this.getMoviesUsecase}) : super(const PopularMoviesState());

  final GetMoviesUsecase getMoviesUsecase;

  Future<void> fetchPopularMovies() async {
    emit(state.copyWith(status: UsecaseStatus.loading));
    final result = await getMoviesUsecase(ApiConstants.endPoints.POPULAR_MOVIES);
    result.fold(
      (failure) => emit(state.copyWith(status: UsecaseStatus.failure, error: failure.response)),
      (movies) => emit(state.copyWith(status: UsecaseStatus.success, movies: movies)),
    );
  }
}
