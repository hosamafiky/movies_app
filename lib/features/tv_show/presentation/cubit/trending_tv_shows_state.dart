import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/tv_show.dart';

part 'trending_tv_shows_state.freezed.dart';

@freezed
class TrendingTVShowsState with _$TrendingTVShowsState {
  const factory TrendingTVShowsState.initial() = _Initial;
  const factory TrendingTVShowsState.loading() = _Loading;
  const factory TrendingTVShowsState.success(List<TVShow> tvShows) = _Success;
  const factory TrendingTVShowsState.error(ErrorResponse error) = _Error;
}
