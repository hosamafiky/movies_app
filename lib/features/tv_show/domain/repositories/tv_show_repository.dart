import 'package:cinemahub/core/errors/failures.dart';
import 'package:cinemahub/features/tv_show/domain/entities/tv_show.dart';
import 'package:dartz/dartz.dart';

abstract class TVShowRepository {
  Future<Either<Failure, List<TVShow>>> getTVShows(String path);
}
