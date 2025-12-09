import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/genre.dart';
import '../repositories/genre_repository.dart';

class GetGenresUsecase {
  final GenreRepository repository;

  const GetGenresUsecase({required this.repository});

  Future<Either<Failure, List<Genre>>> call() async {
    return await repository.getGenres();
  }
}
