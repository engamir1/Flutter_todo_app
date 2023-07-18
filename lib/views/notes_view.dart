import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
                        child: const MyBottomSheet());
                  },
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
