part of 'now_playing_movies_cubit.dart';

class NowPlayingMoviesState extends Equatable {
  const NowPlayingMoviesState({this.status = UsecaseStatus.initial, this.error, this.movies = const []});

  final UsecaseStatus status;
  final ErrorResponse? error;
  final List<Movie> movies;

  NowPlayingMoviesState copyWith({UsecaseStatus? status, ErrorResponse? error, List<Movie>? movies}) {
    return NowPlayingMoviesState(status: status ?? this.status, error: error ?? this.error, movies: movies ?? this.movies);
  }

  @override
  List<Object?> get props => [status, error, movies];
}
