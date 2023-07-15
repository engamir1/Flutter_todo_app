import 'package:flutter/material.dart';
import 'package:todo_app/views/bottom_sheet.dart';

import 'notes_body.dart';

class NotesView extends StatelessWidget {
    const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const MyBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

