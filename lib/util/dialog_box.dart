import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[400],
      content: Container(
        height: 120,
        child: Column(
          children: [
            // Getting user input
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Add a new task"),
            ),

            // Buttons (Save + Cancel)
            Row(
              children: [
                // Save Button


                // Cancel Button
              ],
            )
          ],
        ),

      )

    );
  }
}