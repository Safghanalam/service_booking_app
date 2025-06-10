import 'package:flutter/material.dart';
import 'package:service_booking_app_new/shared/widgets/button_primary.dart';
import 'package:service_booking_app_new/shared/widgets/custom_text_field.dart';
import 'package:service_booking_app_new/features/auth/views/otp.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        // Page title
        leading: BackButton(), // Optional: default back button is auto-shown
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  "assets/images/signup.png",
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 45),
            Text(
              'Hello! Register here to get started',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 40),
            CustomTextField(
              hintText: "Full Name",
              icon: Icons.person,
              controller: firstNameController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: "Mobile Number",
              icon: Icons.phone_android,
              controller: emailController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: "Set Password",
              icon: Icons.password,
              isPasswordField: true,
              controller: passwordController,
            ),
            SizedBox(height: 40),
            ButtonPrimary(
              text: "Verify Otp",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Otp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
