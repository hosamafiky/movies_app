import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'core/dependency_injection/di.dart';
import 'core/observers/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Retrieve API key
  final apiKey = await _retrieveApiKey();

  // Register dependencies
  await DependencyInjector.instance.registerDependencies(apiKey);

  runApp(const MainApp());
}

Future<String> _retrieveApiKey() async {
  // Load environment variables
  try {
    await dotenv.load(fileName: 'SECRET.env');
  } catch (e) {
    debugPrint('SECRET.env not found, using valid fallback');
  }

  // Try to get API_KEY from environment variables or dart-define
  final apiKey = dotenv.env['API_KEY'] ?? const String.fromEnvironment('API_KEY');

  if (apiKey.isEmpty) {
    throw Exception('API_KEY is missing. Please add it to SECRET.env or use --dart-define=API_KEY=your_key');
  }

  return apiKey;
}
