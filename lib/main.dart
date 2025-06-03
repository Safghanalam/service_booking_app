import 'package:flutter/material.dart';
import 'package:service_booking_app_new/features/welcome/views/splash_screen.dart';
import 'package:service_booking_app_new/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
