import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_show_state.dart';

class TvShowCubit extends Cubit<TvShowState> {
  TvShowCubit() : super(TvShowInitial());
}
