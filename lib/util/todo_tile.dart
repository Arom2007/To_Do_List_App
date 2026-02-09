import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  // Each to do tile will have 3 things that vary from tile to tile
  final String taskName; // The name of the task
  final bool taskCompleted; // Did the user complete the task or not
  Function(bool?)? onChanged; // Method on what to do once user clicks on checkbox to complete task
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: Slidable(
        // endActionPane means sliding from right to left
        // startActionPane means sliding from left to right
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
            )
          ],
        ) ,
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.deepPurple[400],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
        
              // Checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.grey[800],),
              // Task Name
              Text(taskName, style: TextStyle(color: Colors.white, decoration: taskCompleted ? TextDecoration.lineThrough: TextDecoration.none, decorationColor: Colors.grey[800], decorationThickness: 4, fontSize: 25)),
            ],
          ),
        ),
      ),
    );
  }
}