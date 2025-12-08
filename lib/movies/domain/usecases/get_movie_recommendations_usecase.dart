import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/repository/movie_repository.dart';

import '../../../core/errors/failures.dart';
import '../entities/movie.dart';

class GetMovieRecommendationsUsecase {
  final MovieRepository repository;

  const GetMovieRecommendationsUsecase({required this.repository});

  Future<Either<Failure, List<Movie>>> call(int id) async {
    return await repository.getMovieRecommendations(id);
  }
}
