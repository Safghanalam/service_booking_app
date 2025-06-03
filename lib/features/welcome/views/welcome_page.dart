import 'package:flutter/material.dart';
import 'package:service_booking_app_new/core/constants/app_colors.dart';
import 'package:service_booking_app_new/features/welcome/widgets/button_primary.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.asset(
                        "assets/images/welcome.jpg",
                        width: 300,
                        height: 300,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Need a Haircut?",
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                                fontSize: 36,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Text(
                      "Book an Appointment",
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Text(
                        "Use our application to book an appointment",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              // 🔽 Bottom Button
              ButtonPrimary(),
            ],
          ),
        ),
      ),
    );
  }
}
