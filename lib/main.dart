import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/core/networking/clients/dio_service.dart';
import 'package:movies_app/movies/presentation/pages/movies_page.dart';

import 'core/dependency_injection/di.dart';
import 'core/observers/bloc_observer.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: 'SECRET.env');
  final apiKey = dotenv.env['API_KEY']!;

  // Register dependencies
  await DependencyInjector.instance.registerDependencies();

  // Add API key before running the app
  await DependencyInjector.instance.sl<DioService>().addApiKey(apiKey);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, themeMode: ThemeMode.dark, home: MainMoviesScreen());
  }
}
