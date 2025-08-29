import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  _PersonalInformationScreenState createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformation> {
  // Controllers for text fields
  final TextEditingController _nameController =
  TextEditingController(text: "Rohit Sharma"); // pre-filled, or "" if empty
  final TextEditingController _emailController =
  TextEditingController(text: "naufalger@gmail.com");
  final TextEditingController _phoneController =
  TextEditingController(text: "081234567890");
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _countryController =
  TextEditingController(text: "Jakarta, Indonesia");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Personal Information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primary),
        ),
        leading: const BackButton(color: AppColors.primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Avatar
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/register.jpeg"),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Rohit Sharma",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary),
                      ),
                      Text(
                        "6388945674",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Name
            _buildTextField("Name", _nameController),

            // Email
            _buildTextField("Email Address", _emailController),

            // Phone Number
            _buildTextField("Phone Number", _phoneController,
                keyboardType: TextInputType.phone),

            // Date of Birth
            _buildTextField("Date of Birth", _dobController,
                hint: "dd/mm/yyyy"),

            // Country
            _buildTextField("Country", _countryController),

            const SizedBox(height: 30),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Save logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Changes Saved")),
                  );
                },
                child: const Text("Saved Change",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {String? hint, TextInputType keyboardType = TextInputType.text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: AppColors.primary,   // ✅ Change label color here
            fontWeight: FontWeight.w500,
          ),
          hintText: hint ?? "Enter $label",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        ),
      ),
    );
  }
}
