import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/interface/error_response.dart';
import '../../domain/entities/actor.dart';

part 'cast_state.freezed.dart';

@freezed
abstract class CastState with _$CastState {
  const factory CastState.initial() = _Initial;
  const factory CastState.loading() = _Loading;
  const factory CastState.success(List<Actor> actors) = _Success;
  const factory CastState.error(ErrorResponse error) = _Error;
}
