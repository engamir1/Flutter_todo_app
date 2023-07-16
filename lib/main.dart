 
import 'package:flutter/material.dart';
// 0
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/constants/constants.dart';
 
import 'views/notes_view.dart';

void main() async {
  // 1
  await Hive.initFlutter();
  // 2
  await Hive.openBox(knotes);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(brightness: Brightness.dark),
      home: const NotesView( ),
    );
  }
}

 
