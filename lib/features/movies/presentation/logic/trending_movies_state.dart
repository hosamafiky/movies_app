part of 'trending_movies_cubit.dart';

class TrendingMoviesState extends Equatable {
  const TrendingMoviesState({this.status = UsecaseStatus.initial, this.error, this.movies = const []});

  final UsecaseStatus status;
  final ErrorResponse? error;
  final List<Movie> movies;

  TrendingMoviesState copyWith({UsecaseStatus? status, ErrorResponse? error, List<Movie>? movies}) {
    return TrendingMoviesState(status: status ?? this.status, error: error ?? this.error, movies: movies ?? this.movies);
  }

  @override
  List<Object?> get props => [status, error, movies];
}
