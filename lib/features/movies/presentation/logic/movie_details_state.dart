part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetailsStatus = UsecaseStatus.initial,
    this.movieDetailsError,
    this.movieDetails,
    this.castStatus = UsecaseStatus.initial,
    this.castError,
    this.cast = const [],
    this.trailersStatus = UsecaseStatus.initial,
    this.trailersError,
    this.trailers = const [],
    this.similarStatus = UsecaseStatus.initial,
    this.similarError,
    this.similarMovies = const [],
    this.recommendationsStatus = UsecaseStatus.initial,
    this.recommendationsError,
    this.recommendationsMovies = const [],
  });

  final UsecaseStatus movieDetailsStatus;
  final ErrorResponse? movieDetailsError;
  final MovieDetails? movieDetails;

  final UsecaseStatus castStatus;
  final ErrorResponse? castError;
  final List<Actor> cast;

  final UsecaseStatus trailersStatus;
  final ErrorResponse? trailersError;
  final List<Trailer> trailers;

  final UsecaseStatus similarStatus;
  final ErrorResponse? similarError;
  final List<Movie> similarMovies;

  final UsecaseStatus recommendationsStatus;
  final ErrorResponse? recommendationsError;
  final List<Movie> recommendationsMovies;

  MovieDetailsState copyWith({
    UsecaseStatus? movieDetailsStatus,
    ErrorResponse? movieDetailsError,
    MovieDetails? movieDetails,
    UsecaseStatus? castStatus,
    ErrorResponse? castError,
    List<Actor>? cast,
    UsecaseStatus? trailersStatus,
    ErrorResponse? trailersError,
    List<Trailer>? trailers,
    UsecaseStatus? similarStatus,
    ErrorResponse? similarError,
    List<Movie>? similarMovies,
    UsecaseStatus? recommendationsStatus,
    ErrorResponse? recommendationsError,
    List<Movie>? recommendationsMovies,
  }) {
    return MovieDetailsState(
      movieDetailsStatus: movieDetailsStatus ?? this.movieDetailsStatus,
      movieDetailsError: movieDetailsError ?? this.movieDetailsError,
      movieDetails: movieDetails ?? this.movieDetails,
      castStatus: castStatus ?? this.castStatus,
      castError: castError ?? this.castError,
      cast: cast ?? this.cast,
      trailersStatus: trailersStatus ?? this.trailersStatus,
      trailersError: trailersError ?? this.trailersError,
      trailers: trailers ?? this.trailers,
      similarStatus: similarStatus ?? this.similarStatus,
      similarError: similarError ?? this.similarError,
      similarMovies: similarMovies ?? this.similarMovies,
      recommendationsStatus: recommendationsStatus ?? this.recommendationsStatus,
      recommendationsError: recommendationsError ?? this.recommendationsError,
      recommendationsMovies: recommendationsMovies ?? this.recommendationsMovies,
    );
  }

  @override
  List<Object?> get props => [
    movieDetailsStatus,
    movieDetailsError,
    movieDetails,
    castStatus,
    castError,
    cast,
    trailersStatus,
    trailersError,
    trailers,
    similarStatus,
    similarError,
    similarMovies,
    recommendationsStatus,
    recommendationsError,
    recommendationsMovies,
  ];
}
