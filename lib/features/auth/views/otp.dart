import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_booking_app_new/features/Home/views/home.dart';
import 'package:service_booking_app_new/shared/widgets/button_primary.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../app/provider/auth_provider.dart';
import '../../../core/constants/app_colors.dart';

class Otp extends StatefulWidget {
  final String phoneNumber; // ✅ phone number passed from login

  const Otp({super.key, required this.phoneNumber});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController otpController = TextEditingController();
  bool isOtpEntered = false;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final otp = otpController.text.trim();

    if (otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter OTP"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // ✅ Call verifyOtp API
    await authProvider.verifyOtp(widget.phoneNumber, otp);

    if (authProvider.verifyOtpResponse != null &&
        authProvider.verifyOtpResponse!.success) {
      // ✅ OTP verified → Navigate to Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } else {
      // ❌ Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            authProvider.verifyOtpResponse?.message ?? "Invalid OTP",
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Otp Verification',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primary,
          ),
        ),
        leading: const BackButton(color: AppColors.primary),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
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
            const SizedBox(height: 10),
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
            const SizedBox(height: 25),

            // ✅ OTP Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                controller: otpController,
                onChanged: (value) {
                  setState(() {
                    isOtpEntered = value.length == 6;
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
                  fieldHeight: 45,
                  fieldWidth: 45,
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
            const SizedBox(height: 35),

            // ✅ Verify OTP Button
            AbsorbPointer(
              absorbing: !isOtpEntered || authProvider.isLoading,
              child: Opacity(
                opacity: isOtpEntered ? 1.0 : 0.5,
                child: ButtonPrimary(
                  onPressed: _submit,
                  text: authProvider.isLoading ? "Verifying..." : "Verify OTP",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
