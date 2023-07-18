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
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBAr(
                  text: "Edite Note",
                  iconName: Icons.check,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 50),
                const CustomTextField(hintText: "Title", maxLines: 1),
                const CustomTextField(hintText: "Description", maxLines: 4),
                const SizedBox(height: 100),
                // SubmitButton(text: "Edit"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
