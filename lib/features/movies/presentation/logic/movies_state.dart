part of 'movies_cubit.dart';

class MoviesState extends Equatable {
  const MoviesState({
    this.nowPlayingStatus = UsecaseStatus.initial,
    this.nowPlayingError,
    this.nowPlayingMovies = const [],
    this.popularStatus = UsecaseStatus.initial,
    this.popularError,
    this.popularMovies = const [],
    this.trendingStatus = UsecaseStatus.initial,
    this.trendingError,
    this.trendingMovies = const [],
    this.genreStatus = UsecaseStatus.initial,
    this.genreError,
    this.genreMovies = const [],
    this.movieDetailsStatus = UsecaseStatus.initial,
    this.movieDetailsError,
    this.movieDetails,
    this.recommendationsStatus = UsecaseStatus.initial,
    this.recommendationsError,
    this.recommendationsMovies = const [],
  });

  final UsecaseStatus nowPlayingStatus;
  final ErrorResponse? nowPlayingError;
  final List<Movie> nowPlayingMovies;

  final UsecaseStatus popularStatus;
  final ErrorResponse? popularError;
  final List<Movie> popularMovies;

  final UsecaseStatus trendingStatus;
  final ErrorResponse? trendingError;
  final List<Movie> trendingMovies;

  final UsecaseStatus genreStatus;
  final ErrorResponse? genreError;
  final List<Movie> genreMovies;

  final UsecaseStatus movieDetailsStatus;
  final ErrorResponse? movieDetailsError;
  final MovieDetails? movieDetails;

  final UsecaseStatus recommendationsStatus;
  final ErrorResponse? recommendationsError;
  final List<Movie> recommendationsMovies;

  MoviesState copyWith({
    UsecaseStatus? nowPlayingStatus,
    ErrorResponse? nowPlayingError,
    List<Movie>? nowPlayingMovies,
    UsecaseStatus? popularStatus,
    ErrorResponse? popularError,
    List<Movie>? popularMovies,
    UsecaseStatus? trendingStatus,
    ErrorResponse? trendingError,
    List<Movie>? trendingMovies,
    UsecaseStatus? genreStatus,
    ErrorResponse? genreError,
    List<Movie>? genreMovies,
    UsecaseStatus? movieDetailsStatus,
    ErrorResponse? movieDetailsError,
    MovieDetails? movieDetails,
    UsecaseStatus? recommendationsStatus,
    ErrorResponse? recommendationsError,
    List<Movie>? recommendationsMovies,
  }) {
    return MoviesState(
      nowPlayingStatus: nowPlayingStatus ?? this.nowPlayingStatus,
      nowPlayingError: nowPlayingError ?? this.nowPlayingError,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularStatus: popularStatus ?? this.popularStatus,
      popularError: popularError ?? this.popularError,
      popularMovies: popularMovies ?? this.popularMovies,
      trendingStatus: trendingStatus ?? this.trendingStatus,
      trendingError: trendingError ?? this.trendingError,
      trendingMovies: trendingMovies ?? this.trendingMovies,
      genreStatus: genreStatus ?? this.genreStatus,
      genreError: genreError ?? this.genreError,
      genreMovies: genreMovies ?? this.genreMovies,
      movieDetailsStatus: movieDetailsStatus ?? this.movieDetailsStatus,
      movieDetailsError: movieDetailsError ?? this.movieDetailsError,
      movieDetails: movieDetails ?? this.movieDetails,
      recommendationsStatus: recommendationsStatus ?? this.recommendationsStatus,
      recommendationsError: recommendationsError ?? this.recommendationsError,
      recommendationsMovies: recommendationsMovies ?? this.recommendationsMovies,
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
    trendingStatus,
    trendingError,
    trendingMovies,
    genreStatus,
    genreError,
    genreMovies,
    movieDetailsStatus,
    movieDetailsError,
    movieDetails,
    recommendationsStatus,
    recommendationsError,
    recommendationsMovies,
  ];
}
