import '../../domain/entities/trailer.dart';

class TrailerModel extends Trailer {
  const TrailerModel({required super.id, required super.key, required super.name, required super.publishedAt});

  factory TrailerModel.fromMap(Map<String, dynamic> map) {
    return TrailerModel(id: map['id'] as String, key: map['key'] as String, name: map['name'] as String, publishedAt: map['published_at'] as String);
  }
}
