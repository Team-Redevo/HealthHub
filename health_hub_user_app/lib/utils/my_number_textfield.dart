import 'package:flutter/material.dart';
import 'package:health_hub_user_app/main.dart';

class MyNumberField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyNumberField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 236, 236, 236),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        keyboardType: TextInputType.number, // This keyboard type restricts input to numeric characters
      ),
    );
  }
}
