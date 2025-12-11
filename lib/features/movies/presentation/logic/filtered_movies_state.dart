part of 'filtered_movies_cubit.dart';

class FilteredMoviesState extends Equatable {
  const FilteredMoviesState({this.status = UsecaseStatus.initial, this.error, this.movies = const []});

  final UsecaseStatus status;
  final ErrorResponse? error;
  final List<Movie> movies;

  FilteredMoviesState copyWith({UsecaseStatus? status, ErrorResponse? error, List<Movie>? movies}) {
    return FilteredMoviesState(status: status ?? this.status, error: error ?? this.error, movies: movies ?? this.movies);
  }

  @override
  List<Object?> get props => [status, error, movies];
}
