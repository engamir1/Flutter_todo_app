import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/models/notes_model.dart';
import 'package:todo_app/widgets/submit_button.dart';
import 'package:todo_app/widgets/text_field.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  // add key to form
  final GlobalKey<FormState> formKey = GlobalKey();
  // add validation
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // what we will recieve
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextField(
                  hintText: "Title",
                  maxLines: 1,
                  onSave: (value) {
                    title = value;
                    print(title);

                  }),
              CustomTextField(
                  hintText: "Description",
                  maxLines: 4,
                  onSave: (value) {
                    description = value;
                  }),
              const SizedBox(
                height: 100,
              ),
              SubmitButton(
                  text: "Add",
                  onTap: () {

                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var noteModel = NoteModel(
                          title: title!,
                          description: description!,
                          date: DateTime.now().toString(),
                          color: 1);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
