import 'package:cinemahub/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/genre.dart';

abstract class GenreRepository {
  Future<Either<Failure, List<Genre>>> getGenres();
}
