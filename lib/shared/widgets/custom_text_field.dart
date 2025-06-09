import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final bool isPasswordField;
  final TextEditingController controller;


  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPasswordField = false,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isPasswordField) {
      return TextField(
        controller: widget.controller,
        obscureText: _isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: _toggleVisibility,
          ),
        ),
      );
    } else {
      return TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
        ),
      );
    }
  }
}
