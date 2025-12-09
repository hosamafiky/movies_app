import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final List<int> genreIds;
  final String title, backdropPath, overview, releaseDate;
  final double voteAverage;

  String fullBackdropPath({int size = 500}) => 'https://image.tmdb.org/t/p/w$size$backdropPath';

  const Movie({
    required this.id,
    required this.genreIds,
    required this.title,
    required this.voteAverage,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [id, genreIds, title, voteAverage, backdropPath, overview, releaseDate];
}
