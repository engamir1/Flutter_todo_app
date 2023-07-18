import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// 0
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/simple_bloc_observer.dart';

import 'models/notes_model.dart';
import 'views/notes_view.dart';

void main() async {
  // 1 initialize
  await Hive.initFlutter();
  // 2 register adapter
  Hive.registerAdapter(NoteModelAdapter());
  // 3 open box
  await Hive.openBox<NoteModel>(knotes);
  // 4 observe what happens in State
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(brightness: Brightness.dark),
      home: const NotesView(),
    );
  }
}
