import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/widgets/custom_app.dart';
import 'package:todo_app/widgets/list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomAppBAr(
              text: "Notes App",
              onPressed: () {},
            ),
            const SizedBox(height: 15),
            // we should make listView out alone
            const NotesListView(),
          ],
        ),
      ),
    );
  }
}
