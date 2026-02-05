import 'package:flutter/material.dart';
import 'package:to_do_list_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {

  // List of to do tasks
    List todoList = [
      ["Make Tutorial", false],
      ["Do Something", false]

    ];


    // Checkbox was tapped
    void checkBoxChanged(bool? value, int index) {
      setState(() {
        // When checkbox is tapped it sets the checkbox to the opposite of what it initially was
        // Example if it was false before tap, it becomes true after tap so that box goes from unchecked to checked
        todoList[index][1] = !todoList[index][1];
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: Text("T O  D O", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(taskName: todoList[index][0], taskCompleted: todoList[index][1], onChanged: (value) => checkBoxChanged(value, index));
        },
      )

    );
  }
}