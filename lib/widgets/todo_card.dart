import 'package:flutter/material.dart';
import 'package:todo_app/views/edit_note_view.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const EditNote();
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Title here",
                style: TextStyle(fontSize: 35, color: Colors.black),
              ),
              IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.delete, size: 35, color: Colors.black)),
            ],
          ),
          const Text(
            " RenderExcludeSemantics#bd704 relayoutBoundary=up6 NEEDS-elayoutBoundary=up6 NEEDS-elayoutBoundary=up6 NEEDS-elayoutBoundary=up6 NEEDS-elayoutBoundary=up6 NEEDS-ela Boundary=up6 NEEDS-elayoutBBoundary=up6 NEEDS-elayoutBBoundary=up6 NEEDS-elayoutBBoundary=up6 NEEDS-elayoutByoutBoundary=up6 NEEDS-LAYOUT NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDAT",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black38, fontSize: 18, height: 1.4),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
              "date: 20 /1 /2023 ",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ]),
        ]),
      ),
    );
  }
}
