import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/trailer.dart';
import '../repository/movie_repository.dart';

class GetMovieTrailersUsecase {
  final MovieRepository repository;

  GetMovieTrailersUsecase({required this.repository});

  Future<Either<Failure, List<Trailer>>> call(int id) async {
    return await repository.getMovieTrailers(id);
  }
}
