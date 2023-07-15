import 'package:flutter/material.dart';
import 'package:todo_app/widgets/search_icon.dart';

class CustomAppBAr extends StatelessWidget {
  const CustomAppBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Notes App",
          style: TextStyle(fontSize: 30),
        ),
        SearchWidget()
      ],
    );
  }
}
