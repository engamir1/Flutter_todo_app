// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.iconName,
  }) : super(key: key);
final IconData iconName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        onPressed: () {},
        icon:   Icon(
         iconName,
          size: 40,
        ),
      ),
    );
  }
}
