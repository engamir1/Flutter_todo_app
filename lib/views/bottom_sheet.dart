import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text_field.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          CustomTextField(),
          CustomTextField(),
        ],
      ),
   
    
    );
  }
}
