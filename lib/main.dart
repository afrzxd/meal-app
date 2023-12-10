import 'package:flutter/material.dart';
import 'package:mealapp/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meal App",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
