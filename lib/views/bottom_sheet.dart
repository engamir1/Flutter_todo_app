import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/models/notes_model.dart';
import 'package:todo_app/widgets/submit_button.dart';
import 'package:todo_app/widgets/text_field.dart';

import '../cubits/notes_cubit/notes_cubit_cubit.dart';
import 'color_pallete.dart';

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
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AddNoteSuccess) {
          print(state);
          BlocProvider.of<NotesCubitCubit>(context).notes;
          Navigator.pop(context);
        } else if (state is AddNoteFailure) {
          print("error ${state.errMsg}");
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddNoteLoading ? true : false,
          child: Container(
            padding: EdgeInsets.only(
                left: 12.0,
                right: 12,
                top: 12,
                bottom: MediaQuery.of(context).viewInsets.bottom + 12),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    const Text(
                      "اضف مهمة",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                        hintText: "العنوان",
                        maxLines: 1,
                        onSave: (value) {
                          title = value;
                          // print(title);
                        }),
                    CustomTextField(
                        hintText: "الوصف",
                        maxLines: 4,
                        onSave: (value) {
                          description = value;
                        }),
                    const SizedBox(height: 20),
                    const Text(
                      "اختار لون للمهمة",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 12),
                    const ColorList(),
                    const SizedBox(height: 20),
                    SubmitButton(
                        text: "Add",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            var noteModel = NoteModel(
                                title: title!,
                                description: description!,
                                date: DateTime.now().toString(),
                                color: BlocProvider.of<AddNoteCubit>(context)
                                    .color!
                                    .value);
                            BlocProvider.of<AddNoteCubit>(context)
                                .addNote(noteModel);
                                
                            // tell cubit that when i press add and it is ok and validat
                            // please emit state of NotesSuccess
                            // so when any widget listen to my state of NotesSuccess
                            // it will rebuild

                            BlocProvider.of<NotesCubitCubit>(context)
                                .fetchAllNotes();
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
