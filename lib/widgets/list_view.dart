import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:todo_app/models/notes_model.dart';
import 'package:todo_app/widgets/todo_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NotesCubitCubit, NotesCubitState>(
      listener: (context, state) {},
        builder: (context, state) {
          // BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();

          List<NoteModel> notes =
              BlocProvider.of<NotesCubitCubit>(context).notes;
            return notes.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, ids) {
                        return Column(
                          children: [
                            TodoCard(note: notes[ids]),
                          const SizedBox(height: 12),
                          ],
                        );
                      },
                      itemCount: notes.length,
                    ),
                  )
              : Center(child: SvgPicture.asset("assets/images/add.svg"));
        });
  } 
   
}

