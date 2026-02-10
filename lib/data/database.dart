import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  // reference our box
  final _myBox = Hive.openBox("myBox");

}