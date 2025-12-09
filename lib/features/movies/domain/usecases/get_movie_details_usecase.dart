import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie_details.dart';
import '../repository/movie_repository.dart';

class GetMovieDetailsUsecase {
  final MovieRepository repository;

  const GetMovieDetailsUsecase({required this.repository});

  Future<Either<Failure, MovieDetails>> call(int id) async {
    return await repository.getMovieDetails(id);
  }
}
