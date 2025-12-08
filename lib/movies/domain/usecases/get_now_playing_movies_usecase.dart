import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/repository/movie_repository.dart';

import '../../../core/errors/failures.dart';
import '../entities/movie.dart';

class GetNowPlayingMoviesUsecase {
  final MovieRepository repository;

  const GetNowPlayingMoviesUsecase({required this.repository});

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getNowPlayingMovies();
  }
}
