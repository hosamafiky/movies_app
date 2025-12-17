import '../../../filter/data/models/genre_model.dart';
import '../../domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.genreIds,
    required super.title,
    required super.voteAverage,
    required super.voteCount,
    required super.backdropPath,
    required super.posterPath,
    required super.overview,
    required super.releaseDate,
    required super.genres,
    required super.runtime,
  });

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailsModel(
      id: map['id'],
      genreIds: List<int>.from(map['genres']?.map((genre) => genre['id']) ?? []),
      title: map['title'] ?? '',
      voteAverage: ((map['vote_average'] as num) / 2).toDouble(),
      voteCount: map['vote_count'] ?? 0,
      backdropPath: map['backdrop_path'] ?? '',
      posterPath: map['poster_path'] ?? '',
      overview: map['overview'] ?? '',
      releaseDate: map['release_date'] ?? '',
      genres: List<GenreModel>.from(map['genres']?.map((genre) => GenreModel.fromMap(genre)) ?? []),
      runtime: map['runtime'] ?? 0,
    );
  }
}
