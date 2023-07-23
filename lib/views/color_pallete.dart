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
  final List<Color> colors = [
    Colors.amber,
    Colors.green,
    Colors.pink,
    Colors.blueAccent,
    Colors.red,
    Colors.purple

  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteLoading) {}
      },
      builder: (context, state) {
        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (context, ids) {
              BlocProvider.of<AddNoteCubit>(context).color =
                  colors[BlocProvider.of<AddNoteCubit>(context).curIndex];
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<AddNoteCubit>(context).colorTap();
                  print("the ids is $ids");
                  // print(
                  //     "the color is ${BlocProvider.of<AddNoteCubit>(context).color}");

                  BlocProvider.of<AddNoteCubit>(context).curIndex = ids;
                  print(
                      "the index is ${BlocProvider.of<AddNoteCubit>(context).curIndex}");

                },
                child: BlocProvider.of<AddNoteCubit>(context).curIndex == ids
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 80,
                        width: 80,
                        color: colors[ids],
                        child: const Icon(
                          Icons.check,
                          size: 50,
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
      },
    );
  }
}
