// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_app/widgets/search_icon.dart';

class CustomAppBAr extends StatelessWidget {
  const CustomAppBAr({
    Key? key,
    required this.text,
    this.iconName = Icons.search,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final IconData iconName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 30),
        ),
        SearchWidget(
          iconName: iconName,
          onPressed: onPressed,
        )
      ],
    );
  }
}
