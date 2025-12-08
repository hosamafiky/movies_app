part of 'movies_cubit.dart';

class MoviesState extends Equatable {
  const MoviesState({this.nowPlayingStatus = UsecaseStatus.initial, this.nowPlayingError, this.nowPlayingMovies = const []});

  final UsecaseStatus nowPlayingStatus;
  final ErrorResponse? nowPlayingError;
  final List<Movie> nowPlayingMovies;

  MoviesState copyWith({UsecaseStatus? nowPlayingStatus, ErrorResponse? nowPlayingError, List<Movie>? nowPlayingMovies}) {
    return MoviesState(
      nowPlayingStatus: nowPlayingStatus ?? this.nowPlayingStatus,
      nowPlayingError: nowPlayingError ?? this.nowPlayingError,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
    );
  }

  @override
  List<Object?> get props => [nowPlayingStatus, nowPlayingError, nowPlayingMovies];
}
