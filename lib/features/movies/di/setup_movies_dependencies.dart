import '../../../core/dependency_injection/di.dart';
import '../data/datasources/movies_remote_datasource.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repository/movie_repository.dart';
import '../domain/usecases/get_movie_cast_usecase.dart';
import '../domain/usecases/get_movie_details_usecase.dart';
import '../domain/usecases/get_movie_trailers_usecase.dart';
import '../domain/usecases/get_movies_usecase.dart';
import '../presentation/logic/movies_cubit.dart';

void setUpMoviesDependencies() async {
  // CUBIT
  DependencyInjector.instance.sl.registerFactory(
    () => MoviesCubit(
      getMoviesUsecase: DependencyInjector.instance.sl(),
      getMovieDetailsUsecase: DependencyInjector.instance.sl(),
      getMovieTrailersUsecase: DependencyInjector.instance.sl(),
      getMovieCastUsecase: DependencyInjector.instance.sl(),
    ),
  );

  // USECASES
  DependencyInjector.instance.sl.registerLazySingleton(() => GetMoviesUsecase(repository: DependencyInjector.instance.sl()));
  DependencyInjector.instance.sl.registerLazySingleton(() => GetMovieDetailsUsecase(repository: DependencyInjector.instance.sl()));
  DependencyInjector.instance.sl.registerLazySingleton(() => GetMovieTrailersUsecase(repository: DependencyInjector.instance.sl()));
  DependencyInjector.instance.sl.registerLazySingleton(() => GetMovieCastUsecase(repository: DependencyInjector.instance.sl()));

  // REPOSITORIES
  DependencyInjector.instance.sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDatasource: DependencyInjector.instance.sl()));

  // DATASOURCES
  DependencyInjector.instance.sl.registerLazySingleton<MoviesRemoteDatasource>(() => MoviesRemoteDatasourceImpl());
}
