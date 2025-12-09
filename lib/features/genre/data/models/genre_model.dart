import '../../../genre/domain/entities/genre.dart';

class GenreModel extends Genre {
  const GenreModel({required super.id, required super.name});

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(id: map['id'], name: map['name']);
  }
}
