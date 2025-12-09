import 'package:cinemahub/core/enums/time_window.dart';
import 'package:cinemahub/core/networking/api_constants.dart';
import 'package:cinemahub/features/tv_show/domain/entities/tv_show.dart';
import 'package:cinemahub/features/tv_show/domain/usecases/get_tv_shows_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/interface/error_response.dart';

part 'tv_show_state.dart';

class TVShowCubit extends Cubit<TVShowState> {
  TVShowCubit({required this.getTVShowsUsecase}) : super(TVShowState());

  final GetTVShowsUsecase getTVShowsUsecase;

  Future<void> fetchTrendingTVShows({TimeWindow timeWindow = TimeWindow.day}) async {
    emit(state.copyWith(trendingStatus: UsecaseStatus.loading));

    final result = await getTVShowsUsecase(ApiConstants.endPoints.TRENDING_TV_SHOWS(timeWindow));

    result.fold(
      (failure) => emit(state.copyWith(trendingStatus: UsecaseStatus.failure, trendingError: failure.response)),
      (tvShows) => emit(state.copyWith(trendingStatus: UsecaseStatus.success, trendingTVShows: tvShows)),
    );
  }
}
