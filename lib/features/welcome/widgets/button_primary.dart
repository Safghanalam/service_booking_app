import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            print("Button Clicked");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            "LET'S GO!",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.backgroundColor,
              fontSize: 12,
            ),
          ),
        ),
    );
  }
}
