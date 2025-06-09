import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:service_booking_app_new/shared/widgets/button_primary.dart';
import 'package:service_booking_app_new/shared/widgets/custom_text_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (kDebugMode) {
      print("First Name: ${firstNameController.text}");
      print("Last Name: ${lastNameController.text}");
      print("Email: ${emailController.text}");
      print("Password: ${passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // Page title
        leading: BackButton(), // Optional: default back button is auto-shown
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset(
                  "assets/images/urban.png",
                  width: 250,
                  height: 250,
                  fit: BoxFit.fitHeight,
                ),
              ),
              CustomTextField(hintText: "First Name", icon: Icons.person, controller: firstNameController,),
              SizedBox(height: 20),
              CustomTextField(hintText: "Last Name", icon: Icons.person, controller: lastNameController,),
              SizedBox(height: 20),
              CustomTextField(hintText: "Email", icon: Icons.email, controller: emailController,),
              SizedBox(height: 20),
              CustomTextField(
                hintText: "Password",
                icon: Icons.password,
                isPasswordField: true,
                controller: passwordController,
              ),
              SizedBox(height: 50),
              ButtonPrimary(
                onPressed: _submit,
                text: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
