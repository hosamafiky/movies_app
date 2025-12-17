import 'package:cinemahub/core/base/base_cubit.dart';

import '../../../../core/enums/media_type.dart';
import '../../../../core/enums/time_window.dart';
import '../../../../core/networking/api_constants.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import 'trending_movies_state.dart';

class TrendingMoviesCubit extends BaseCubit<TrendingMoviesState> {
  TrendingMoviesCubit({required this.getMoviesUsecase}) : super(const TrendingMoviesState.initial());

  final GetMoviesUsecase getMoviesUsecase;

  Future<void> fetchTrendingMovies({TimeWindow timeWindow = TimeWindow.day}) async {
    final params = GetMoviesParams(path: ApiConstants.endPoints.TRENDING(MediaType.movie, timeWindow));
    await execute<List<Movie>>(
      action: () => getMoviesUsecase(params),
      onLoading: () => const TrendingMoviesState.loading(),
      onSuccess: (movies) => TrendingMoviesState.success(movies),
      onFailure: (error) => TrendingMoviesState.error(error),
    );
  }
}
