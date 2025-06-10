import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:service_booking_app_new/features/auth/views/register.dart';
import 'package:service_booking_app_new/shared/widgets/button_primary.dart';
import 'package:service_booking_app_new/shared/widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _RegisterState();
}

class _RegisterState extends State<Login> {

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
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
                    "assets/images/login.png",
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  'Welcom back!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 40),
                CustomTextField(hintText: "Mobile Number", icon: Icons.phone_android, controller: emailController),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: "Password",
                  icon: Icons.password,
                  isPasswordField: true,
                  controller: passwordController,
                ),
                SizedBox(height: 15),
                Text(
                  'Forgot Password?',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 40),
                ButtonPrimary(
                  onPressed: _submit,
                  text: "Login",
                ),
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
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      TextSpan(
                        text: ' now.',
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
