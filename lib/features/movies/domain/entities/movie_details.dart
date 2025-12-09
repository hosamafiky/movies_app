import 'genre.dart';
import 'movie.dart';

class MovieDetails extends Movie {
  final List<Genre> genres;
  final int runtime;

  const MovieDetails({
    required super.id,
    required super.genreIds,
    required super.title,
    required super.voteAverage,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required this.genres,
    required this.runtime,
  });

  @override
  List<Object?> get props => super.props + [genres, runtime];
}
