import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/repository/movie_repository.dart';

import '../../../core/errors/failures.dart';
import '../entities/movie_details.dart';

class GetMovieDetailsUsecase {
  final MovieRepository repository;

  const GetMovieDetailsUsecase({required this.repository});

  Future<Either<Failure, MovieDetails>> call(int id) async {
    return await repository.getMovieDetails(id);
  }
}
