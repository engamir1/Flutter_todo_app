import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/models/notes_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color ?color ;
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(knotes);
      await notesBox.add(note);
      // print("notes now is at add $note");
      print("notes now is at add ${notesBox.values.toList().reversed}");

      emit(AddNoteSuccess());
    } catch (e) {
      // TODO
 
      AddNoteFailure(e.toString());
      emit(AddNoteFailure(e.toString()));

    }
  }
}
