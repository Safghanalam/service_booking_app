import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:service_booking_app_new/features/auth/views/register.dart';
import 'package:service_booking_app_new/shared/widgets/button_primary.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/constants/app_colors.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _RegisterState();
}

class _RegisterState extends State<Otp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (kDebugMode) {
      print("Email: ${emailController.text}");
      print("Password: ${passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Otp Verification',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // Page title
        leading: BackButton(), // Optional: default back button is auto-shown
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(
                    "assets/images/otp.png",
                    width: 300,
                    height: 300,
                  ),
                ),
                Text(
                  'Enter OTP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 40),
                PinCodeTextField(
                  appContext: context,
                  length: 5,
                  controller: otpController,
                  onChanged: (value) {
                    // Optionally handle input changes
                  },
                  onCompleted: (value) {
                    print("Completed: $value");
                  },
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(6),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: AppColors.primary,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Forgot Password?',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 40),
                ButtonPrimary(onPressed: _submit, text: "Login"),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: ' now.',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
