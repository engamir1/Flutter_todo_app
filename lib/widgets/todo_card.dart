import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:todo_app/models/notes_model.dart';
import 'package:todo_app/views/edit_note_view.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNote(note: note);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        width: double.infinity,
        decoration: BoxDecoration(
            // color: Colors.orangeAccent,
            color: Color(note.color),
            borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                note.title,
                // TODO fix text overflow in title
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: const TextStyle(fontSize: 35, color: Colors.black),
              ),
              IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
                },
                icon: const Icon(Icons.delete, size: 35, color: Colors.black),
              ),
            ],
          ),
          Text(
            note.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black38, fontSize: 18, height: 1.4),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              note.date,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ]),
        ]),
      ),
    );
  }
}
