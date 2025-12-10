import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'core/dependency_injection/di.dart';
import 'core/networking/clients/dio_service.dart';
import 'core/observers/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Load environment variables
  await dotenv.load(fileName: 'SECRET.env');
  final apiKey = dotenv.env['API_KEY']!;

  // Register dependencies
  await DependencyInjector.instance.registerDependencies();

  // Add API key before running the app
  await DependencyInjector.instance.sl<DioService>().addApiKey(apiKey);

  runApp(const MainApp());
}
