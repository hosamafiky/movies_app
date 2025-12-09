import 'package:cinemahub/core/extensions/error_handler.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/tv_show.dart';
import '../../domain/repositories/tv_show_repository.dart';
import '../datasources/tv_show_remote_datasource.dart';

class TVShowRepositoryImpl implements TVShowRepository {
  final TVShowRemoteDataSource remoteDataSource;

  TVShowRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TVShow>>> getTVShows(String path) async {
    return await remoteDataSource.getTVShows(path).handleCallbackWithFailure;
  }
}
