import 'package:flutter/material.dart';
import 'package:healthguide/screens/onboarding.dart';
import 'package:healthguide/screens/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Remove the const keyword here
    );
  }
}
