import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nutri_fit/core/configs/theme/app_theme.dart';
import 'package:nutri_fit/firebase_options.dart';
import 'package:nutri_fit/presentation/router/router.dart';
import 'package:nutri_fit/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const NutriFitApp());
}

class NutriFitApp extends StatefulWidget {
  const NutriFitApp({super.key});

  @override
  State<NutriFitApp> createState() => _NutriFitAppState();
}

class _NutriFitAppState extends State<NutriFitApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme, // Светлая тема
      darkTheme: AppTheme.darkTheme, // Тёмная тема
      themeMode: ThemeMode.system, // Используем системную тему
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
    );
  }
}
