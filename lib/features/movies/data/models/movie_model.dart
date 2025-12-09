import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.genreIds,
    required super.title,
    required super.voteAverage,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
  });

  factory MovieModel.fromEntity(Movie movie) {
    return MovieModel(
      id: movie.id,
      genreIds: movie.genreIds,
      title: movie.title,
      voteAverage: movie.voteAverage,
      backdropPath: movie.backdropPath,
      overview: movie.overview,
      releaseDate: movie.releaseDate,
    );
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      genreIds: List<int>.from(map['genre_ids'].map((x) => x)),
      title: map['title'],
      voteAverage: (map['vote_average'] as num).toDouble(),
      backdropPath: map['backdrop_path'] ?? '',
      overview: map['overview'] ?? '',
      releaseDate: map['release_date'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'genre_ids': genreIds,
      'title': title,
      'vote_average': voteAverage,
      'backdrop_path': backdropPath,
      'overview': overview,
      'release_date': releaseDate,
    };
  }
}
