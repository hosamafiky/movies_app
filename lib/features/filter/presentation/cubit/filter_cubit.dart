import 'package:cinemahub/core/enums/sort_by.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/interface/error_response.dart';
import '../../../movies/domain/usecases/get_movies_usecase.dart';
import '../../domain/entities/genre.dart';
import '../../domain/usecases/get_genres_usecase.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit({required this.getGenresUsecase}) : super(FilterState());

  final GetGenresUsecase getGenresUsecase;

  Future<void> fetchGendres() async {
    emit(state.copyWith(status: UsecaseStatus.loading));
    final result = await getGenresUsecase();
    result.fold(
      (failure) => emit(state.copyWith(status: UsecaseStatus.failure, error: failure.response)),
      (genres) => emit(state.copyWith(status: UsecaseStatus.success, genres: genres)),
    );
  }

  void selectGenre(Genre? genre) {
    emit(state.copyWith(filters: state.filters.copyWith(genre: genre)));
  }

  void selectSortBy(SortBy? sortBy) {
    emit(state.copyWith(filters: state.filters.copyWith(sortBy: sortBy)));
  }

  void selectYear(int? year) {
    emit(state.copyWith(filters: state.filters.copyWith(year: year)));
  }
}
