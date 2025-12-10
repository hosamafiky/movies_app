import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/actor.dart';
import '../repository/movie_repository.dart';

class GetMovieCastUsecase {
  final MovieRepository repository;

  GetMovieCastUsecase({required this.repository});

  Future<Either<Failure, List<Actor>>> call(int id) async {
    return await repository.getMovieCast(id);
  }
}
