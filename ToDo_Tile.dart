import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDo_Tile extends StatelessWidget {
  final String taskName;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDo_Tile({
    super.key,
    required this.taskName,
    required this.taskcompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
           children: [
             SlidableAction(
               onPressed: deleteFunction,
              icon: Icons.delete,
               backgroundColor: Colors.red.shade200,
               borderRadius: BorderRadius.circular(12),
             ),
           ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          child: Row(
            children: [
              Checkbox(value: taskcompleted, onChanged: onChanged),
        
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskcompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ), // task name
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
