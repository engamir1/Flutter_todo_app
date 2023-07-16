import 'package:flutter/material.dart';
import 'package:todo_app/widgets/submit_button.dart';
import 'package:todo_app/widgets/text_field.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 400,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(hintText: "Title", maxLines: 1),
            CustomTextField(hintText: "Description", maxLines: 4),
            SizedBox(
              height: 100,
            ),
            SubmitButton(text: "Add"),
          ],
        ),
      ),
    );
  }
}
