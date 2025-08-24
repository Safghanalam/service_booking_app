import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_booking_app_new/core/constants/app_colors.dart';
import 'package:service_booking_app_new/features/auth/views/otp.dart';
import 'package:service_booking_app_new/shared/widgets/button_primary.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();
  bool isPhoneEntered = false; // ✅ track phone number validity

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_checkPhone); // listen for changes
  }

  @override
  void dispose() {
    phoneController.removeListener(_checkPhone);
    phoneController.dispose();
    super.dispose();
  }

  void _checkPhone() {
    setState(() {
      isPhoneEntered = phoneController.text.length == 10;
    });
  }

  void _submit() {
    if (phoneController.text.length == 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Otp(
            phoneNumber: phoneController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid 10-digit number")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primary),
        ),
        leading: const BackButton(color: AppColors.primary),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: ClipRRect(
                child: Image.asset(
                  "assets/images/login.png",
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 35),
            const Text(
              'Enter your phone number',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 30),

            // Phone Number Input
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              cursorColor: AppColors.primary,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                ),
                hintText: "Enter your number",
                prefix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "+91",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(width: 6),
                    Container(height: 22, width: 1, color: Colors.grey),
                    const SizedBox(width: 6),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Submit button (disabled until phone entered)
            AbsorbPointer(
              absorbing: !isPhoneEntered,
              child: Opacity(
                opacity: isPhoneEntered ? 1.0 : 0.5,
                child: ButtonPrimary(
                  onPressed: _submit,
                  text: "Get OTP",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
