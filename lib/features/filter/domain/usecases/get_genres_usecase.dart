import 'package:cinemahub/core/base/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/genre.dart';
import '../repositories/filter_repository.dart';

class GetGenresUsecase extends BaseUseCaseWithoutParams<List<Genre>> {
  final GenreRepository repository;

  GetGenresUsecase({required this.repository});

  @override
  Future<Either<Failure, List<Genre>>> call() async {
    return await repository.getGenres();
  }
}
