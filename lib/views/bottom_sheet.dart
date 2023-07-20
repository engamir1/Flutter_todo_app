import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/models/notes_model.dart';
import 'package:todo_app/widgets/submit_button.dart';
import 'package:todo_app/widgets/text_field.dart';

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
                      height: 20),
                    const ColorList(),
                    const SizedBox(height: 20
                    ),
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

