import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit() : super(WatchlistInitial());
}
