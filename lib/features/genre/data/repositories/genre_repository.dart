import 'package:cinemahub/core/extensions/error_handler.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/genre.dart';
import '../../domain/repositories/genre_repository.dart';
import '../datasources/genre_remote_datasource.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreRemoteDataSource remoteDataSource;

  GenreRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Genre>>> getGenres() async {
    return await remoteDataSource.getGenres().handleCallbackWithFailure;
  }
}
