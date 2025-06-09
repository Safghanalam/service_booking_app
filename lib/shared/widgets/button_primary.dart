import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ButtonPrimary extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const ButtonPrimary({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 18),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.backgroundColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
