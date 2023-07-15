import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, ids) {
          return const Column(
            children: [
              TodoCard(),
              SizedBox(height: 15),

            ],
          );
        },
        itemCount: 7,
      ),
    );
  }
}
