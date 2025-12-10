import 'package:cinemahub/features/movies/domain/entities/actor.dart';
import 'package:cinemahub/features/movies/domain/entities/trailer.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getMovies(String path, {Map<String, dynamic>? queryParameters});
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id);
  Future<Either<Failure, List<Trailer>>> getMovieTrailers(int id);
  Future<Either<Failure, List<Actor>>> getMovieCast(int id);
}
