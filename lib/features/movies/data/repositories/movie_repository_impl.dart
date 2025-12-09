import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/error_handler.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasources/movies_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteDatasource remoteDatasource;

  const MovieRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Movie>>> getMovies(String path) async {
    return await remoteDatasource.getMovies(path).handleCallbackWithFailure;
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id) async {
    return await remoteDatasource.getMovieDetails(id).handleCallbackWithFailure;
  }

  @override
  Future<Either<Failure, List<Movie>>> getMovieRecommendations(int id) async {
    return await remoteDatasource.getMovieRecommendations(id).handleCallbackWithFailure;
  }
}
