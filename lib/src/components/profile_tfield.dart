import 'package:flutter/material.dart';

class ProfileTfield extends StatelessWidget {
  const ProfileTfield({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
       keyboardType: TextInputType.text,
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: const Icon(
          Icons.edit,
          color: Color.fromARGB(255, 128, 127, 127),
        ),
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 128, 127, 127),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
