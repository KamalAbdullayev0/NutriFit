
import 'package:flutter/material.dart';
import 'package:nutri_fit/core/theme/app_theme.dart';
import 'package:nutri_fit/presentation/splash/pages/splash.dart';

Future<void> main() async {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,   // Светлая тема
      darkTheme: AppTheme.darkTheme, // Тёмная тема
      themeMode: ThemeMode.system,  // Используем системную тему
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
