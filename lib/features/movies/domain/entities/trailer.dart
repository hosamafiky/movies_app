import 'package:equatable/equatable.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Trailer extends Equatable {
  final String name;
  final String key;
  final String publishedAt;
  final String id;

  String get fullYoutubePath => 'https://www.youtube.com/watch?v=$key';

  const Trailer({required this.name, required this.key, required this.publishedAt, required this.id});

  factory Trailer.empty() {
    return Trailer(name: BoneMock.name, key: BoneMock.city, publishedAt: BoneMock.date, id: '');
  }

  @override
  List<Object?> get props => [name, key, publishedAt, id];
}
