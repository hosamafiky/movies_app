import 'package:movies_app/core/dependency_injection/di.dart';
import 'package:movies_app/movies/domain/repository/movie_repository.dart';

import '../data/datasources/movies_remote_datasource.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/usecases/get_movie_details_usecase.dart';
import '../domain/usecases/get_movie_recommendations_usecase.dart';
import '../domain/usecases/get_now_playing_movies_usecase.dart';
import '../domain/usecases/get_popular_movies_usecase.dart';
import '../domain/usecases/get_top_rated_movies_usecase.dart';
import '../presentation/logic/movies_cubit.dart';

void setUpMoviesDependencies() async {
  // CUBIT
  DependencyInjector.instance.sl.registerFactory(
    () => MoviesCubit(
      getNowPlayingMoviesUsecase: DependencyInjector.instance.sl(),
      getPopularMoviesUsecase: DependencyInjector.instance.sl(),
      getTopRatedMoviesUsecase: DependencyInjector.instance.sl(),
      getMovieDetailsUsecase: DependencyInjector.instance.sl(),
      getMovieRecommendationsUsecase: DependencyInjector.instance.sl(),
    ),
  );

  // USECASES
  DependencyInjector.instance.sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(repository: DependencyInjector.instance.sl()));
  DependencyInjector.instance.sl.registerLazySingleton(() => GetPopularMoviesUsecase(repository: DependencyInjector.instance.sl()));
  DependencyInjector.instance.sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(repository: DependencyInjector.instance.sl()));
  DependencyInjector.instance.sl.registerLazySingleton(() => GetMovieDetailsUsecase(repository: DependencyInjector.instance.sl()));
  DependencyInjector.instance.sl.registerLazySingleton(() => GetMovieRecommendationsUsecase(repository: DependencyInjector.instance.sl()));

  // REPOSITORIES
  DependencyInjector.instance.sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDatasource: DependencyInjector.instance.sl()));

  // DATASOURCES
  DependencyInjector.instance.sl.registerLazySingleton<MoviesRemoteDatasource>(() => MoviesRemoteDatasourceImpl());
}
