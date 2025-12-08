part of 'movies_cubit.dart';

class MoviesState extends Equatable {
  const MoviesState({
    this.nowPlayingStatus = UsecaseStatus.initial,
    this.nowPlayingError,
    this.nowPlayingMovies = const [],
    this.popularStatus = UsecaseStatus.initial,
    this.popularError,
    this.popularMovies = const [],
    this.topRatedStatus = UsecaseStatus.initial,
    this.topRatedError,
    this.topRatedMovies = const [],
  });

  final UsecaseStatus nowPlayingStatus;
  final ErrorResponse? nowPlayingError;
  final List<Movie> nowPlayingMovies;

  final UsecaseStatus popularStatus;
  final ErrorResponse? popularError;
  final List<Movie> popularMovies;

  final UsecaseStatus topRatedStatus;
  final ErrorResponse? topRatedError;
  final List<Movie> topRatedMovies;

  MoviesState copyWith({
    UsecaseStatus? nowPlayingStatus,
    ErrorResponse? nowPlayingError,
    List<Movie>? nowPlayingMovies,
    UsecaseStatus? popularStatus,
    ErrorResponse? popularError,
    List<Movie>? popularMovies,
    UsecaseStatus? topRatedStatus,
    ErrorResponse? topRatedError,
    List<Movie>? topRatedMovies,
  }) {
    return MoviesState(
      nowPlayingStatus: nowPlayingStatus ?? this.nowPlayingStatus,
      nowPlayingError: nowPlayingError ?? this.nowPlayingError,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularStatus: popularStatus ?? this.popularStatus,
      popularError: popularError ?? this.popularError,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedStatus: topRatedStatus ?? this.topRatedStatus,
      topRatedError: topRatedError ?? this.topRatedError,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingStatus,
    nowPlayingError,
    nowPlayingMovies,
    popularStatus,
    popularError,
    popularMovies,
    topRatedStatus,
    topRatedError,
    topRatedMovies,
  ];
}
