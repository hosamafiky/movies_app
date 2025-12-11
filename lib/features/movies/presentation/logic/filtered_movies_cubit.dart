import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';

part 'filtered_movies_state.dart';

class FilteredMoviesCubit extends Cubit<FilteredMoviesState> {
  FilteredMoviesCubit({required this.getMoviesUsecase}) : super(const FilteredMoviesState());

  final GetMoviesUsecase getMoviesUsecase;

  Future<void> fetchFilteredMovies(GetMoviesFilters filters) async {
    emit(state.copyWith(status: UsecaseStatus.loading));
    final result = await getMoviesUsecase(ApiConstants.endPoints.DISCOVER_MOVIES, filters: filters);
    result.fold(
      (failure) => emit(state.copyWith(status: UsecaseStatus.failure, error: failure.response)),
      (movies) => emit(state.copyWith(status: UsecaseStatus.success, movies: movies)),
    );
  }
}
