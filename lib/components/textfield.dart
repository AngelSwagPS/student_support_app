import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const UserTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey.shade100),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade400, width: 1)),
            fillColor: Colors.blueGrey.shade200,
            filled: true,
            hintText: hintText),
      ),
    );
  }
}
