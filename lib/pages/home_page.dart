import 'package:flutter/material.dart';
import 'package:flutter_revision/components/dialog_box.dart';
import 'package:flutter_revision/data/database.dart';
import 'package:hive/hive.dart';

import '../components/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();
  //reference hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState( ){
    //to do ko implementation

    //if this is the first time ever
    if(_myBox.get("TODOLIST") == null ){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }




  //checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  //save new task

  void saveNewTask() {
    setState(() {
     db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Center(
            child: Text(
              "TO DO",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'JetBrains',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) =>
                    deleteTask(index), // Pass index to deleteTask
              );
            }));
  }
}
