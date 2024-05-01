import 'package:hive/hive.dart';
class ToDoDatabase{
  //list of todos task
  List toDoList = [];

  //reference the box
  final _myBox = Hive.box('mybox');

  //run this method when ran for the first time
  void createInitialData() {
    toDoList = [
      ["Make coffee", false],
      ["Do Exercise", false],
    ];
  }
  //loading in database
    void loadData() {
      toDoList = _myBox.get("TODOLIST");
    }

    //update the database
    void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
    }
  }
