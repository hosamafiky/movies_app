import 'package:cinemahub/core/base/base_cubit.dart';
import 'package:cinemahub/core/enums/time_window.dart';
import 'package:cinemahub/core/networking/api_constants.dart';
import 'package:cinemahub/features/tv_show/domain/usecases/get_tv_shows_usecase.dart';

import 'trending_tv_shows_state.dart';

class TrendingTVShowsCubit extends BaseCubit<TrendingTVShowsState> {
  TrendingTVShowsCubit({required this.getTVShowsUsecase}) : super(const TrendingTVShowsState.initial());

  final GetTVShowsUsecase getTVShowsUsecase;

  Future<void> fetchTrendingTVShows({TimeWindow timeWindow = TimeWindow.day}) async {
    final params = ApiConstants.endPoints.TRENDING(.tv, timeWindow);
    return await execute(
      action: () => getTVShowsUsecase(params),
      onLoading: () => const TrendingTVShowsState.loading(),
      onSuccess: (tvShows) => TrendingTVShowsState.success(tvShows),
      onFailure: (failure) => TrendingTVShowsState.error(failure),
    );
  }
}
