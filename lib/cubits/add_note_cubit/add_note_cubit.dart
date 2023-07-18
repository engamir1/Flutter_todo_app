import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/models/notes_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(knotes);
 
      emit(AddNoteSuccess());

      await notesBox.add(note);
    } catch (e) {
      // TODO
 
      AddNoteFailure(e.toString());
    }
  }
}
