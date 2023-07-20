import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';

class ColorList extends StatefulWidget {
  const ColorList({
    super.key,
  });

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  bool isSelected = false;

  final List<Color> colors = [
    Colors.amber,
    Colors.green,
    Colors.yellow,
    Colors.blueAccent,
    Colors.redAccent
  ];

  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, ids) {
          print("the index is $ids");
          return GestureDetector(
            onTap: () {
              curIndex = ids;
              setState(() {});
              BlocProvider.of<AddNoteCubit>(context).color = colors[ids];
                                   
                              
            },
            child: curIndex == ids
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 80,
                    width: 80,
                    color: colors[ids],
                    child: const Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.black54,
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 70,
                    width: 70,
                    color: colors[ids],
                  ),
          );
        },
      ),
    );
  }
}
