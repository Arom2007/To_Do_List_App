import 'package:hive/hive.dart';

class ToDoDatabase {
  List todoList = [];
  // reference our box
  final _myBox = Hive.box("myBox");


  // run this method if this is the first time ever opening this app
  void createInitialData() {
    todoList = [
      ["Add a task", false],
      ["Complete all tasks", false]
    ];
  }


  // load the data from the database
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }



  // update the database
void updateDataBase() {
  _myBox.put("TODOLIST", todoList);
}

}