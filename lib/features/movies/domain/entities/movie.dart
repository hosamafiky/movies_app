import 'package:equatable/equatable.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Movie extends Equatable {
  final int id;
  final List<int> genreIds;
  final String title, backdropPath, posterPath, overview, releaseDate;
  final double voteAverage;

  String? get fullBackdropPath => backdropPath.isEmpty ? null : 'https://image.tmdb.org/t/p/w500$backdropPath';
  String? get fullPosterPath => posterPath.isEmpty ? null : 'https://image.tmdb.org/t/p/w500$posterPath';

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

  factory Movie.empty() {
    return Movie(id: 0, genreIds: [], title: BoneMock.title, voteAverage: 0.0, backdropPath: '', posterPath: '', overview: '', releaseDate: '');
  }

  @override
  List<Object?> get props => [id, genreIds, title, voteAverage, backdropPath, posterPath, overview, releaseDate];
}
