import 'package:flutter/material.dart';
import 'package:health_hub_user_app/main.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: cardBackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
