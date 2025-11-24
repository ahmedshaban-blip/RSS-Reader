// main.dart
import 'package:flutter/material.dart';
import 'package:rss_reader_pro/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RSS Reader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3F51B5),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: -1.0,
          ),
          titleMedium: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: const SplashPage(),
    );
  }
}
