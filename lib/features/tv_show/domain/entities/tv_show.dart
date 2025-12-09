import 'package:equatable/equatable.dart';

class TVShow extends Equatable {
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final double voteAverage;

  String get fullPosterPath => 'https://image.tmdb.org/t/p/w500$posterPath';

  const TVShow({required this.id, required this.name, required this.overview, required this.posterPath, required this.voteAverage});

  @override
  List<Object?> get props => [id, name, overview, posterPath, voteAverage];
}
