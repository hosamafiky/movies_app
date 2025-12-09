import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetMovieRecommendationsUsecase {
  final MovieRepository repository;

  const GetMovieRecommendationsUsecase({required this.repository});

  Future<Either<Failure, List<Movie>>> call(int id) async {
    return await repository.getMovieRecommendations(id);
  }
}
