import 'package:flutter/material.dart';
import 'package:service_booking_app_new/features/welcome/views/welcome_page.dart';

import '../../../core/helpers.dart';
import '../../Home/views/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  double _scale = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _navigateToNext();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          _scale = 1.0;
        });
      }
    });
  }

  Future<void> _navigateToNext() async {
    final helper = Helpers();

    // Keep splash visible for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final token = await helper.getSharedPreferences(key: "auth_token");

    if (token != null && token.isNotEmpty) {
      // ✅ Token exists → go to Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Home()),
      );
    } else {
      // ❌ No token → go to Welcome/Login flow
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WelcomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: _scale),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeOutBack,
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/urban.png',
            width: 400,
          ),
        ),
      ),
    );
  }
}
