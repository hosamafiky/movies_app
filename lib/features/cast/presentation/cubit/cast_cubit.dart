import 'package:cinemahub/core/base/base_cubit.dart';

import '../../domain/usecases/get_cast_usecase.dart';
import 'cast_state.dart';

class CastCubit extends BaseCubit<CastState> {
  CastCubit({required this.getCastUsecase}) : super(const CastState.initial());

  final GetCastUsecase getCastUsecase;

  Future<void> fetchCast(GetCastParams params) async {
    return await execute(
      action: () => getCastUsecase(params),
      onLoading: () => const CastState.loading(),
      onSuccess: (actors) => CastState.success(actors),
      onFailure: (failure) => CastState.error(failure),
    );
  }
}
