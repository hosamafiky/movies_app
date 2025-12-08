import 'package:movies_app/core/dependency_injection/di.dart';
import 'package:movies_app/movies/domain/repository/movie_repository.dart';

import '../data/datasources/movies_remote_datasource.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/usecases/get_now_playing_movies_usecase.dart';
import '../presentation/logic/movies_cubit.dart';

void setUpMoviesDependencies() async {
  // CUBIT
  DependencyInjector.instance.sl.registerFactory(() => MoviesCubit(getNowPlayingMoviesUsecase: DependencyInjector.instance.sl()));

  // USECASES
  DependencyInjector.instance.sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(repository: DependencyInjector.instance.sl()));

  // REPOSITORIES
  DependencyInjector.instance.sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDatasource: DependencyInjector.instance.sl()));

  // DATASOURCES
  DependencyInjector.instance.sl.registerLazySingleton<MoviesRemoteDatasource>(() => MoviesRemoteDatasourceImpl());
}
