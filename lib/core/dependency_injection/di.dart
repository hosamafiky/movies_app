import 'package:get_it/get_it.dart';

import '../../movies/di/setup_movies_dependencies.dart';
import '../networking/clients/dio_service.dart';
import '../networking/interface/api_service.dart';

class DependencyInjector {
  DependencyInjector._();
  static final DependencyInjector instance = DependencyInjector._();
  factory DependencyInjector() => instance;

  final GetIt sl = GetIt.instance;

  Future<void> registerDependencies() async {
    setUpGeneralDependencies();
    setUpMoviesDependencies();
  }

  void setUpGeneralDependencies() {
    sl.registerLazySingleton<DioService>(() => DioService());
    sl.registerLazySingleton<ApiService>(() => sl<DioService>());
  }
}
