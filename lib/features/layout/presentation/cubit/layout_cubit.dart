import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../../../movies/presentation/pages/movies_page.dart';
import '../../../search/presentation/pages/search_page.dart';
import '../../../tv_show/presentation/pages/tv_shows_page.dart';
import '../../../watchlist/presentation/pages/watchlist_page.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(const LayoutState());

  void changeIndex(int index) => emit(state.copyWith(currentIndex: index));
}
