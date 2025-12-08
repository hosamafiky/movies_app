import 'package:dartz/dartz.dart';
import 'package:movies_app/core/extensions/error_handler.dart';

import '../../../core/errors/failures.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasources/movies_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteDatasource remoteDatasource;

  const MovieRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    return await remoteDatasource.getNowPlayingMovies().handleCallbackWithFailure;
  }
}
