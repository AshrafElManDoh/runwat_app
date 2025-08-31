import 'package:flutter/material.dart';
import 'package:runway_app/views/splash_view.dart';

void main() {
  runApp(const RunwayApp());
}

class RunwayApp extends StatelessWidget {
  const RunwayApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashView(),
    );
  }
}
