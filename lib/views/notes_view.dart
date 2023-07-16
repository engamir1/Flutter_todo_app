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
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
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

