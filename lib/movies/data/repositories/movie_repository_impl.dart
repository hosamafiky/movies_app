import 'package:dartz/dartz.dart';
import 'package:movies_app/core/extensions/error_handler.dart';

import '../../../core/errors/failures.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasources/movies_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteDatasource remoteDatasource;

  const MovieRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    return await remoteDatasource.getNowPlayingMovies().handleCallbackWithFailure;
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    return await remoteDatasource.getPopularMovies().handleCallbackWithFailure;
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    return await remoteDatasource.getTopRatedMovies().handleCallbackWithFailure;
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
