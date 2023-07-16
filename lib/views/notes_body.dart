import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_app.dart';
import 'package:todo_app/widgets/list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomAppBAr(text: "Notes App"),
            SizedBox(height: 15),
            // we should make listView out alone
            NotesListView(),

          ],
        ),
      ),
    );
  }
}

