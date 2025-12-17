import 'package:cinemahub/core/base/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie_details.dart';
import '../repository/movie_repository.dart';

class GetMovieDetailsUsecase extends BaseUsecase<MovieDetails, int> {
  final MovieRepository repository;

  GetMovieDetailsUsecase({required this.repository});

  @override
  Future<Either<Failure, MovieDetails>> call(int params) async {
    return await repository.getMovieDetails(params);
  }
}
