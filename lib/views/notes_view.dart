import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/add_note_cubit/add_note_cubit.dart';
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
              // if i want it to take whole page height
              isScrollControlled: true,
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => AddNoteCubit(),
                  child: const MyBottomSheet(),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
