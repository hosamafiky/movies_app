part of 'filter_cubit.dart';

class FilterState extends Equatable {
  const FilterState({
    this.status = UsecaseStatus.initial,
    this.error,
    this.genres = const [],
    // SELECTED FILTERS
    this.filters = const GetMoviesFilters(),
  });

  final UsecaseStatus status;
  final ErrorResponse? error;
  final List<Genre> genres;

  // SELECTED FILTERS
  final GetMoviesFilters filters;

  FilterState copyWith({UsecaseStatus? status, ErrorResponse? error, List<Genre>? genres, GetMoviesFilters? filters}) {
    return FilterState(status: status ?? this.status, error: error ?? this.error, genres: genres ?? this.genres, filters: filters ?? this.filters);
  }

  @override
  List<Object?> get props => [status, error, genres, filters];
}
