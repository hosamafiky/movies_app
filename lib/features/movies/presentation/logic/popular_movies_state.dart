part of 'popular_movies_cubit.dart';

class PopularMoviesState extends Equatable {
  const PopularMoviesState({this.status = UsecaseStatus.initial, this.error, this.movies = const []});

  final UsecaseStatus status;
  final ErrorResponse? error;
  final List<Movie> movies;

  PopularMoviesState copyWith({UsecaseStatus? status, ErrorResponse? error, List<Movie>? movies}) {
    return PopularMoviesState(status: status ?? this.status, error: error ?? this.error, movies: movies ?? this.movies);
  }

  @override
  List<Object?> get props => [status, error, movies];
}
