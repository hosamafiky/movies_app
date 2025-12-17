import 'package:cinemahub/core/base/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/trailer.dart';
import '../repository/movie_repository.dart';

class GetMovieTrailersUsecase extends BaseUsecase<List<Trailer>, int> {
  final MovieRepository repository;

  GetMovieTrailersUsecase({required this.repository});

  @override
  Future<Either<Failure, List<Trailer>>> call(int params) async {
    return await repository.getMovieTrailers(params);
  }
}
