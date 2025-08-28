import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_booking_app_new/features/welcome/views/splash_screen.dart';
import 'package:service_booking_app_new/core/theme/theme.dart';

import 'app/provider/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Booking App',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
