import 'package:cinemahub/features/tv_show/domain/entities/tv_show.dart';

class TVShowModel extends TVShow {
  const TVShowModel({required super.id, required super.name, required super.overview, required super.posterPath, required super.voteAverage});

  factory TVShowModel.fromMap(Map<String, dynamic> map) {
    return TVShowModel(
      id: map['id'],
      name: map['name'],
      overview: map['overview'],
      posterPath: map['poster_path'] ?? '',
      voteAverage: (map['vote_average'] as num).toDouble(),
    );
  }
}
