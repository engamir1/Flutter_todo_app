import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_app.dart';
import 'package:todo_app/widgets/text_field.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBAr(text: "Edite Note", iconName: Icons.edit),
                SizedBox(height: 50),
                CustomTextField(hintText: "Title", maxLines: 1),
                CustomTextField(hintText: "Description", maxLines: 4),
                SizedBox(height: 100),
                // SubmitButton(text: "Edit"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
