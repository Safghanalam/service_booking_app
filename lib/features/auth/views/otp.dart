import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:service_booking_app_new/features/Home/views/home.dart';
import 'package:service_booking_app_new/shared/widgets/button_primary.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/constants/app_colors.dart';

class Otp extends StatefulWidget {
  final String phoneNumber; // ✅ store the phone number

  const Otp({super.key, required this.phoneNumber});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController otpController = TextEditingController();
  final String staticOtp = "12345"; // ✅ Static OTP for now
  bool isOtpEntered = false;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void _submit() {
    if (otpController.text == staticOtp) {
      // ✅ Navigate only if OTP matches
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Register()),
      );
    } else {
      // ❌ Show error if OTP does not match
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid OTP. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Otp Verificatio',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                "assets/images/otp.png",
                width: 250,
                height: 250,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Verify your phone number',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'We have sent the verification code to your phone number',
                style: TextStyle(fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PinCodeTextField(
                appContext: context,
                length: 5,
                controller: otpController,
                onChanged: (value) {
                  setState(() {
                    isOtpEntered = value.length == 5;
                  });
                },
                onCompleted: (value) {
                  if (kDebugMode) {
                    print("Completed: $value");
                  }
                },
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(6),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeColor: AppColors.primary,
                  selectedColor: AppColors.primary,
                  inactiveColor: Colors.black,
                  disabledColor: Colors.grey,
                  borderWidth: 1.5,
                ),
                cursorColor: AppColors.primary,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Resend OTP',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 40),
            AbsorbPointer(
              absorbing: !isOtpEntered, // disable taps
              child: Opacity(
                opacity: isOtpEntered ? 1.0 : 0.5, // grey out when disabled
                child: ButtonPrimary(
                  onPressed: _submit, // always non-null
                  text: "Login",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
