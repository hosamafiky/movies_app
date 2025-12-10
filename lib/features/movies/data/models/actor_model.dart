import 'package:cinemahub/features/movies/domain/entities/actor.dart';

class ActorModel extends Actor {
  const ActorModel({
    required super.id,
    required super.adult,
    required super.gender,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    required super.profilePath,
    required super.castId,
    required super.character,
    required super.creditId,
    required super.order,
  });

  factory ActorModel.fromMap(Map<String, dynamic> map) {
    return ActorModel(
      id: map['id'] ?? 0,
      adult: map['adult'] ?? false,
      gender: map['gender'] ?? 0,
      knownForDepartment: map['known_for_department'] ?? '',
      name: map['name'] ?? '',
      originalName: map['original_name'] ?? '',
      popularity: map['popularity'] ?? 0.0,
      profilePath: map['profile_path'] ?? 'https://i.ibb.co/5GzXkwq/avatar-${map['gender'].toString().toLowerCase() == '1' ? 'female' : 'male'}.png',
      castId: map['cast_id'] ?? 0,
      character: map['character'] ?? '',
      creditId: map['credit_id'] ?? '',
      order: map['order'] ?? 0,
    );
  }
}
