import 'package:cinemahub/core/errors/failures.dart';
import 'package:cinemahub/core/extensions/error_handler.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/enums/media_type.dart';
import '../../domain/entities/actor.dart';
import '../../domain/repositories/cast_repository.dart';
import '../datasources/cast_remote_datasource.dart';

class CastRepositoryImpl implements CastRepository {
  final CastRemoteDataSource remoteDataSource;

  CastRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Actor>>> getCast(MediaType mediaType, int id) async {
    return await remoteDataSource.getCast(mediaType, id).handleCallbackWithFailure;
  }
}
