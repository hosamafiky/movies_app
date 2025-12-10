part of 'genre_cubit.dart';

class GenreState extends Equatable {
  const GenreState({
    this.status = UsecaseStatus.initial,
    this.error,
    this.genres = const [],
    // SELECTED FILTERS
    this.selectedGenre,
    this.selectedSortBy,
  });

  final UsecaseStatus status;
  final ErrorResponse? error;
  final List<Genre> genres;

  // SELECTED FILTERS
  final Genre? selectedGenre;
  final SortBy? selectedSortBy;

  GenreState copyWith({UsecaseStatus? status, ErrorResponse? error, List<Genre>? genres, Genre? selectedGenre, SortBy? selectedSortBy}) {
    return GenreState(
      status: status ?? this.status,
      error: error ?? this.error,
      genres: genres ?? this.genres,
      selectedGenre: selectedGenre ?? this.selectedGenre,
      selectedSortBy: selectedSortBy ?? this.selectedSortBy,
    );
  }

  @override
  List<Object?> get props => [status, error, genres, selectedGenre, selectedSortBy];
}
