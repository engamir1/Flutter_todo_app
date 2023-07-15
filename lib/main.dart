import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
 
        // this is some comment in master
 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
 
        useMaterial3: true,
      ),
      home: const MainPage( ),
    );
  }
}
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
 
    return const MaterialApp( home: Scaffold(
      body: Column(
        children: [
          // this is comment from master 
          Text("my Todo App"),
          // add from new_branch 
          Text("my Todo App"),
          Text("Second App"),

        ],
      ),
    ),);
   }
}
 