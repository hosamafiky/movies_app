import 'package:cinemahub/core/base/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/enums/media_type.dart';
import '../../../../core/errors/failures.dart';
import '../entities/actor.dart';
import '../repositories/cast_repository.dart';

class GetCastUsecase extends BaseUsecase<List<Actor>, GetCastParams> {
  final CastRepository repository;

  GetCastUsecase({required this.repository});

  @override
  Future<Either<Failure, List<Actor>>> call(GetCastParams params) async {
    return await repository.getCast(params.mediaType, params.id);
  }
}

class GetCastParams {
  final int id;
  final MediaType mediaType;

  const GetCastParams({required this.id, this.mediaType = MediaType.movie});
}
