import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class BaseUsecase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}

abstract class BaseUseCaseWithoutParams<T> {
  Future<Either<Failure, T>> call();
}
