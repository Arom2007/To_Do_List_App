import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {

  // Each to do tile will have 3 things that vary from tile to tile
  final String taskName; // The name of the task
  final bool taskCompleted; // Did the user complete the task or not
  Function(bool?)? onChanged; // Method on what to do once user clicks on checkbox to complete task


  ToDoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [

            // Checkbox
            Checkbox(value: taskCompleted, onChanged: onChanged),
            // Task Name
            Text(taskName),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}