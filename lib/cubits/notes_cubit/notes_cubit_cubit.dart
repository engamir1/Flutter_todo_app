import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/models/notes_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  List<NoteModel> notes = [];
  fetchAllNotes() {
    emit(NoteLoading());
    var notesBox = Hive.box<NoteModel>(knotes);
    notes = notesBox.values.toList();
    // print("notes now is $notes");
    emit(NotesSuccess());
 
    return notes.reversed.toList();
  }
}
