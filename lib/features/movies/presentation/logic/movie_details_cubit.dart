import 'package:cinemahub/core/base/base_cubit.dart';
import 'package:cinemahub/features/movies/domain/entities/movie.dart';
import 'package:cinemahub/features/movies/domain/entities/trailer.dart';

import '../../../../core/enums/media_type.dart';
import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/api_constants.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movie_trailers_usecase.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends BaseCubit<MovieDetailsState> {
  MovieDetailsCubit({required this.getMovieDetailsUsecase, required this.getMovieTrailersUsecase, required this.getMoviesUsecase})
    : super(const MovieDetailsState());

  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetMovieTrailersUsecase getMovieTrailersUsecase;
  final GetMoviesUsecase getMoviesUsecase;

  Future<void> fetchMovieDetails(int id) async {
    return await execute<MovieDetails>(
      action: () => getMovieDetailsUsecase(id),
      onLoading: () => state.copyWith(movieDetailsStatus: UsecaseStatus.loading),
      onSuccess: (movieDetails) => state.copyWith(movieDetails: movieDetails, movieDetailsStatus: UsecaseStatus.success),
      onFailure: (error) => state.copyWith(movieDetailsError: error, movieDetailsStatus: UsecaseStatus.failure),
    );
  }

  Future<void> fetchMovieTrailers(int id) async {
    return await execute<List<Trailer>>(
      action: () => getMovieTrailersUsecase(id),
      onLoading: () => state.copyWith(trailersStatus: UsecaseStatus.loading),
      onSuccess: (trailers) => state.copyWith(trailers: trailers, trailersStatus: UsecaseStatus.success),
      onFailure: (error) => state.copyWith(trailersError: error, trailersStatus: UsecaseStatus.failure),
    );
  }

  Future<void> fetchSimilarMovies(int id) async {
    final params = GetMoviesParams(path: ApiConstants.endPoints.SIMILAR(MediaType.movie, id));
    return await execute<List<Movie>>(
      action: () => getMoviesUsecase(params),
      onLoading: () => state.copyWith(similarStatus: UsecaseStatus.loading),
      onSuccess: (movies) => state.copyWith(similarMovies: movies, similarStatus: UsecaseStatus.success),
      onFailure: (error) => state.copyWith(similarError: error, similarStatus: UsecaseStatus.failure),
    );
  }

  Future<void> fetchMovieRecommendations(int id) async {
    final params = GetMoviesParams(path: ApiConstants.endPoints.RECOMMENDATIONS(MediaType.movie, id));
    return await execute<List<Movie>>(
      action: () => getMoviesUsecase(params),
      onLoading: () => state.copyWith(recommendationsStatus: UsecaseStatus.loading),
      onSuccess: (movies) => state.copyWith(recommendationsMovies: movies, recommendationsStatus: UsecaseStatus.success),
      onFailure: (error) => state.copyWith(recommendationsError: error, recommendationsStatus: UsecaseStatus.failure),
    );
  }
}
