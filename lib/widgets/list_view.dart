import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:todo_app/models/notes_model.dart';
import 'package:todo_app/widgets/todo_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes() ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, ids) {
              return Column(
                children: [
                  TodoCard(note: notes[ids]),
                  const SizedBox(height: 15),
                ],
              );
            },
            itemCount: notes.length,
          ),
        );
      },
    );
  }
}
