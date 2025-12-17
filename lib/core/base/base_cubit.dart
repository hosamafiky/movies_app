import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../errors/failures.dart';
import '../networking/interface/error_response.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);

  Future<void> execute<Data>({
    required Future<Either<Failure, Data>> Function() action,
    required S Function(Data data) onSuccess,
    required S Function(ErrorResponse error) onFailure,
    required S Function() onLoading,
  }) async {
    emit(onLoading());
    final result = await action();
    result.fold((failure) => emit(onFailure(failure.response)), (data) => emit(onSuccess(data)));
  }
}
