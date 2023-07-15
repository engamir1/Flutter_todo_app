import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_app.dart';
import 'package:todo_app/widgets/todo_card.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomAppBAr(),
            SizedBox(height: 15), TodoCard()

          ],
        ),
      ),
    );
  }
}
