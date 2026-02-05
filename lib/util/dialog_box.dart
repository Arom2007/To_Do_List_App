import 'package:flutter/material.dart';
import 'package:to_do_list_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[400],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Getting user input
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Add a new task", ),
              style: TextStyle(color: Colors.white),
            ),

            // Buttons (Save + Cancel)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Save Button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 70,), // Gap between the Save and Cancel button

                // Cancel Button
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),

      )

    );
  }
}