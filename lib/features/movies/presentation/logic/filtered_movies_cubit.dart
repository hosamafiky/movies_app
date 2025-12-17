import 'package:cinemahub/core/base/base_cubit.dart';

import '../../../../core/enums/media_type.dart';
import '../../../../core/networking/api_constants.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import 'filtered_movies_state.dart';

class FilteredMoviesCubit extends BaseCubit<FilteredMoviesState> {
  FilteredMoviesCubit({required this.getMoviesUsecase}) : super(const FilteredMoviesState.initial());

  final GetMoviesUsecase getMoviesUsecase;

  Future<void> fetchFilteredMovies(GetMoviesFilters filters) async {
    final params = GetMoviesParams(path: ApiConstants.endPoints.DISCOVER(MediaType.movie), filters: filters);
    await execute<List<Movie>>(
      action: () => getMoviesUsecase(params),
      onLoading: () => const FilteredMoviesState.loading(),
      onSuccess: (movies) => FilteredMoviesState.success(movies),
      onFailure: (error) => FilteredMoviesState.error(error),
    );
  }
}
