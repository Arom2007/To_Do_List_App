import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/data/database.dart';
import 'package:to_do_list_app/util/dialog_box.dart';
import 'package:to_do_list_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {


  // reference the hive box
    final _myBox = Hive.openBox("myBox");

    ToDoDatabase db = ToDoDatabase();

    // Text controller
    final _controller = TextEditingController();

    // Checkbox was tapped
    void checkBoxChanged(bool? value, int index) {
      setState(() {
        // When checkbox is tapped it sets the checkbox to the opposite of what it initially was
        // Example if it was false before tap, it becomes true after tap so that box goes from unchecked to checked
        db.todoList[index][1] = !db.todoList[index][1];
      });
    }

    // Save new task
    void saveNewTask() {
      setState(() {
        db.todoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
    }


    // Function to create new task
    void createNewTask() {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(), // Dismisses the add new task dialogue box
            );
          }
      );
    }


    // Function to delete task via sliding todo tile
    void deleteTask(int index) {
      setState(() {
        db.todoList.removeAt(index);
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[400],
        hoverColor: Colors.deepPurple[500],
        onPressed: createNewTask,
        child: Icon(Icons.add, color: Colors.white,),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
          );
        },
      )

    );
  }
}
