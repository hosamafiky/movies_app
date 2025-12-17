import 'package:cinemahub/features/cast/domain/entities/actor.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/enums/media_type.dart';
import '../../../../core/errors/failures.dart';

abstract class CastRepository {
  Future<Either<Failure, List<Actor>>> getCast(MediaType mediaType, int id);
}
