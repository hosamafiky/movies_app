import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/error_handler.dart';
import '../../domain/entities/actor.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/trailer.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasources/movies_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteDatasource remoteDatasource;

  const MovieRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Movie>>> getMovies(String path, {Map<String, dynamic>? queryParameters}) async {
    return await remoteDatasource.getMovies(path, queryParameters: queryParameters).handleCallbackWithFailure;
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id) async {
    return await remoteDatasource.getMovieDetails(id).handleCallbackWithFailure;
  }

  @override
  Future<Either<Failure, List<Trailer>>> getMovieTrailers(int id) async {
    return await remoteDatasource.getMovieTrailers(id).handleCallbackWithFailure;
  }

  @override
  Future<Either<Failure, List<Actor>>> getMovieCast(int id) async {
    return await remoteDatasource.getMovieCast(id).handleCallbackWithFailure;
  }
}
