import 'package:equatable/equatable.dart';

class Trailer extends Equatable {
  final String name;
  final String key;
  final String publishedAt;
  final String id;

  String get fullYoutubePath => 'https://www.youtube.com/watch?v=$key';

  const Trailer({required this.name, required this.key, required this.publishedAt, required this.id});

  @override
  List<Object?> get props => [name, key, publishedAt, id];
}
