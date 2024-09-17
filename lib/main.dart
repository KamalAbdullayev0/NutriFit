import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nutri_fit/core/configs/theme/app_theme.dart';
import 'package:nutri_fit/firebase_options.dart';
import 'package:nutri_fit/presentation/splash/pages/splash.dart';
import 'package:nutri_fit/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme, // Светлая тема
      darkTheme: AppTheme.darkTheme, // Тёмная тема
      themeMode: ThemeMode.system, // Используем системную тему
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
