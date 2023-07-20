// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/notes_cubit/notes_cubit_cubit.dart';

import 'package:todo_app/models/notes_model.dart';
import 'package:todo_app/widgets/custom_app.dart';
import 'package:todo_app/widgets/submit_button.dart';
import 'package:todo_app/widgets/text_field.dart';

class EditNote extends StatelessWidget {
  const EditNote({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBAr(
                  text: "Edite Note",
                  iconName: Icons.check,
                  onPressed: () {
                    note.save();
                    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();

                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 50),
                CustomTextField(
             
                  hintText: note.title,
                  maxLines: 1,
                  onChanged: (value) {
                    note.title = value ?? note.title;
                  },
                ),
                CustomTextField(

                  hintText: note.description,
                  maxLines: 4,
                  onChanged: (value) {
                    note.description = value ?? note.description;
                  },
                ),
                const SizedBox(height: 100),
                SubmitButton(
                  text: "Edit",
                  onTap: () {
                    note.save();
                    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
