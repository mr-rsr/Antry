import 'package:flutter/material.dart';

class Tfield extends StatelessWidget {
  const Tfield({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        validator: (value) => value!.isEmpty ? 'Please enter $label' : null,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: controller.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  onPressed: () => controller.clear(),
                  icon: const Icon(
                    Icons.close,
                    color: Color.fromARGB(255, 128, 127, 127),
                  )),
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 128, 127, 127),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
