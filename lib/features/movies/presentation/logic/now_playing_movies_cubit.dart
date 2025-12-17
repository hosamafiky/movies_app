import 'package:cinemahub/core/base/base_cubit.dart';
import 'package:cinemahub/core/enums/media_type.dart';

import '../../../../core/networking/api_constants.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends BaseCubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit({required this.getMoviesUsecase}) : super(const NowPlayingMoviesState.initial());

  final GetMoviesUsecase getMoviesUsecase;

  Future<void> fetchNowPlayingMovies() async {
    final params = GetMoviesParams(path: ApiConstants.endPoints.NOW_PLAYING(MediaType.movie));
    return await execute(
      action: () => getMoviesUsecase(params),
      onLoading: () => const NowPlayingMoviesState.loading(),
      onSuccess: (movies) => NowPlayingMoviesState.success(movies),
      onFailure: (error) => NowPlayingMoviesState.error(error),
    );
  }
}
