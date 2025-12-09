import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetMoviesUsecase {
  final MovieRepository repository;

  const GetMoviesUsecase({required this.repository});

  Future<Either<Failure, List<Movie>>> call(String path) async {
    return await repository.getMovies(path);
  }
}
