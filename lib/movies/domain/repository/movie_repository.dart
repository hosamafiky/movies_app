import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

import '../entities/movie_details.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id);
  Future<Either<Failure, List<Movie>>> getMovieRecommendations(int id);
}
