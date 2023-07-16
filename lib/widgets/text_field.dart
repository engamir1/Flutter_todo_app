// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.maxLines,
    required this.hintText,
  }) : super(key: key);

  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          maxLines: maxLines,
          // learn how to add border to textfield
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.orangeAccent),
                borderRadius: BorderRadius.circular(12)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
