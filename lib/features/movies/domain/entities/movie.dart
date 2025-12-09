import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final List<int> genreIds;
  final String title, backdropPath, posterPath, overview, releaseDate;
  final double voteAverage;

  String get fullBackdropPath => 'https://image.tmdb.org/t/p/w500$backdropPath';
  String get fullPosterPath => 'https://image.tmdb.org/t/p/w500$posterPath';

  const Movie({
    required this.id,
    required this.genreIds,
    required this.title,
    required this.voteAverage,
    required this.backdropPath,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [id, genreIds, title, voteAverage, backdropPath, posterPath, overview, releaseDate];
}
