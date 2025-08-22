import 'package:flutter/material.dart';
import 'package:service_booking_app_new/core/constants/app_colors.dart';
import 'package:service_booking_app_new/features/auth/views/login.dart';
import 'package:service_booking_app_new/features/Home/views/home.dart';
import '../../../shared/widgets/button_primary.dart';
import 'dart:io'; // For exit(0)
import 'package:flutter/services.dart'; // For SystemNavigator.pop()


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void navigateToSecondPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        "assets/images/register.jpeg",
                        width: 280,
                        height: 280,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "Welcome to Urban Trim!",
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Need a Haircut? Book an Appointment",
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // 🔽 Bottom Button
              ButtonPrimary(
                onPressed: () => navigateToSecondPage(context),
                text: "Let's Go",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
