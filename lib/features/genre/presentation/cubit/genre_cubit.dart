import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/usecase_status.dart';
import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/genre.dart';
import '../../domain/usecases/get_genres_usecase.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  GenreCubit({required this.getGenresUsecase}) : super(GenreState());

  final GetGenresUsecase getGenresUsecase;

  Future<void> fetchGendres() async {
    emit(state.copyWith(status: UsecaseStatus.loading));

    final result = await getGenresUsecase();

    result.fold(
      (failure) => emit(state.copyWith(status: UsecaseStatus.failure, error: failure.response)),
      (genres) => emit(state.copyWith(status: UsecaseStatus.success, genres: genres)),
    );
  }
}
