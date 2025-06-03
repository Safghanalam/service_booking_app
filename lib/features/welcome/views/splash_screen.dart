import 'package:flutter/material.dart';
import 'package:service_booking_app_new/features/welcome/views/welcome_page.dart';

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
    // Start scale animation after short delay
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _scale = 1.0;
      });
    });
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const WelcomePage()),
    );
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
            width: 200,
          ),
        ),
      ),
    );
  }
}
