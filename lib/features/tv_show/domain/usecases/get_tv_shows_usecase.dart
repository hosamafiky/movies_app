import 'package:cinemahub/core/base/base_usecase.dart';
import 'package:cinemahub/features/tv_show/domain/repositories/tv_show_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/tv_show.dart';

class GetTVShowsUsecase extends BaseUsecase<List<TVShow>, String> {
  final TVShowRepository repository;

  GetTVShowsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<TVShow>>> call(String path) async {
    return await repository.getTVShows(path);
  }
}
