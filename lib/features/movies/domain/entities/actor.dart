import 'package:equatable/equatable.dart';

class Actor extends Equatable {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  String get fullProfilePath {
    if (profilePath.startsWith('http')) {
      return profilePath;
    } else {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    }
  }

  const Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  @override
  List<Object?> get props => [adult, gender, id, knownForDepartment, name, originalName, popularity, profilePath, castId, character, creditId, order];
}
