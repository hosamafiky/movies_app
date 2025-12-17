import '../../../core/dependency_injection/di.dart';
import '../data/datasources/cast_remote_datasource.dart';
import '../data/repositories/cast_repository_impl.dart';
import '../domain/repositories/cast_repository.dart';
import '../domain/usecases/get_cast_usecase.dart';
import '../presentation/cubit/cast_cubit.dart';

void setUpCastDependencies() async {
  // CUBIT
  DependencyInjector.instance.sl.registerFactory(() => CastCubit(getCastUsecase: DependencyInjector.instance.sl()));

  // USECASES
  DependencyInjector.instance.sl.registerLazySingleton(() => GetCastUsecase(repository: DependencyInjector.instance.sl()));

  // REPOSITORIES
  DependencyInjector.instance.sl.registerLazySingleton<CastRepository>(() => CastRepositoryImpl(remoteDataSource: DependencyInjector.instance.sl()));

  // DATASOURCES
  DependencyInjector.instance.sl.registerLazySingleton<CastRemoteDataSource>(() => CastRemoteDataSourceImpl());
}
