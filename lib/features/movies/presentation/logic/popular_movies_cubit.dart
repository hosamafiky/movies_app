import 'package:cinemahub/core/base/base_cubit.dart';
import 'package:cinemahub/core/enums/media_type.dart';
import 'package:cinemahub/features/movies/presentation/logic/popular_movies_state.dart';

import '../../../../core/networking/api_constants.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';

class PopularMoviesCubit extends BaseCubit<PopularMoviesState> {
  PopularMoviesCubit({required this.getMoviesUsecase}) : super(const PopularMoviesState.initial());

  final GetMoviesUsecase getMoviesUsecase;

  Future<void> fetchPopularMovies() async {
    final params = GetMoviesParams(path: ApiConstants.endPoints.POPULAR(MediaType.movie));
    await execute<List<Movie>>(
      action: () => getMoviesUsecase(params),
      onLoading: () => const PopularMoviesState.loading(),
      onSuccess: (movies) => PopularMoviesState.success(movies),
      onFailure: (error) => PopularMoviesState.error(error),
    );
  }
}
