import 'package:cinemahub/core/networking/api_constants.dart';
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final List<int> genreIds;
  final String title, backdropPath, posterPath, overview, releaseDate;
  final double voteAverage;
  final int voteCount;

  String get fullBackdropPath => ApiConstants.fullImage(backdropPath);
  String get fullPosterPath => ApiConstants.fullImage(posterPath);

  const Movie({
    this.id = 0,
    this.genreIds = const [],
    this.title = 'CCCCCCCCC',
    this.voteAverage = 0.0,
    this.voteCount = 0,
    this.backdropPath = '',
    this.posterPath = '',
    this.overview = '',
    this.releaseDate = '2000-01-01',
  });

  @override
  List<Object?> get props => [id, genreIds, title, voteAverage, backdropPath, posterPath, overview, releaseDate, voteCount];
}
