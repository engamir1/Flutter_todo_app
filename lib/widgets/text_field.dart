// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.maxLines,
    required this.hintText,
    this.onSave,
  }) : super(key: key);

  final int maxLines;
  final String hintText;
final void Function(String?)? onSave;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Value is required";
            }
            return null;
          },
          onSaved: onSave,
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
