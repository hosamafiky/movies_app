import '../../../core/dependency_injection/di.dart';
import '../data/datasources/tv_show_remote_datasource.dart';
import '../data/repositories/tv_show_repository.dart';
import '../domain/repositories/tv_show_repository.dart';
import '../domain/usecases/get_tv_shows_usecase.dart';
import '../presentation/cubit/tv_show_cubit.dart';

void setUpTVShowsDependencies() async {
  // CUBIT
  DependencyInjector.instance.sl.registerFactory(() => TVShowCubit(getTVShowsUsecase: DependencyInjector.instance.sl()));

  // USECASES
  DependencyInjector.instance.sl.registerLazySingleton(() => GetTVShowsUsecase(repository: DependencyInjector.instance.sl()));

  // REPOSITORIES
  DependencyInjector.instance.sl.registerLazySingleton<TVShowRepository>(() => TVShowRepositoryImpl(remoteDataSource: DependencyInjector.instance.sl()));

  // DATASOURCES
  DependencyInjector.instance.sl.registerLazySingleton<TVShowRemoteDataSource>(() => TVShowRemoteDataSourceImpl());
}
