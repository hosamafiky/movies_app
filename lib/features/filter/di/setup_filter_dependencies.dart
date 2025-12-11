import '../../../core/dependency_injection/di.dart';
import '../data/datasources/filter_remote_datasource.dart';
import '../data/repositories/filter_repository.dart';
import '../domain/repositories/filter_repository.dart';
import '../domain/usecases/get_genres_usecase.dart';
import '../presentation/cubit/filter_cubit.dart';

void setUpGenreDependencies() async {
  // CUBIT
  DependencyInjector.instance.sl.registerFactory(() => FilterCubit(getGenresUsecase: DependencyInjector.instance.sl()));

  // USECASES
  DependencyInjector.instance.sl.registerLazySingleton(() => GetGenresUsecase(repository: DependencyInjector.instance.sl()));

  // REPOSITORIES
  DependencyInjector.instance.sl.registerLazySingleton<GenreRepository>(() => GenreRepositoryImpl(remoteDataSource: DependencyInjector.instance.sl()));

  // DATASOURCES
  DependencyInjector.instance.sl.registerLazySingleton<GenreRemoteDataSource>(() => GenreRemoteDataSourceImpl());
}
