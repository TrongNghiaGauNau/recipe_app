import 'package:flutter/material.dart';

class TextFieldRecipe extends StatelessWidget {
  const TextFieldRecipe({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
  });

  final Icon? icon;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.grey,
            // Color of the border when not focused
            width: 1.0, // Width of the border when not focused
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },

    );
  }
}