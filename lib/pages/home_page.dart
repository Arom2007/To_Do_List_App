import 'package:flutter/material.dart';
import 'package:to_do_list_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        title: Text("T O  D O", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          ToDoTile(),
        ],
      )

    );
  }
}