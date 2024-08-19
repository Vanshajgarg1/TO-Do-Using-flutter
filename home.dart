import 'package:classico/database.dart';
import 'package:classico/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:classico/ToDo_Tile.dart';
import 'package:hive_flutter/hive_flutter.dart'; 

class home_page extends StatefulWidget {
  home_page({super.key});

  // This list holds the to-do items and their completion status



  State<home_page> createState() => _HomePageState();
}

class _HomePageState extends State<home_page> {
  // reference of hive box
  final _mybox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();
  @override
  void intiState(){
    if(_mybox.get("TODOLIST")== null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }
  // text controller
  final _controller = TextEditingController();


  // Method to handle checkbox state changes
  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      // Toggle the boolean value in the list
      db.ToDoList[index][1] = !db.ToDoList[index][1];

    });
    db.updateDataBase();
  }
  void SaveNextTask() {
  setState(() {
    db.ToDoList.add([_controller.text , false]);
        _controller.clear();
  });
  Navigator.of(context).pop();
  db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return dialog_box(
          controller: _controller,
          onSave: SaveNextTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
  void deleteTask(int index){
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updateDataBase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('TO DO App - - -by- - -(Vanshaj Garg)'),
        backgroundColor: Colors.blue[200],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.ToDoList.length,
        itemBuilder: (context, index) {
          return ToDo_Tile(
            taskName: db.ToDoList[index][0],
            taskcompleted: db.ToDoList[index][1],
            onChanged: (value) => CheckBoxChanged(value, index),
            deleteFunction: (context)=> deleteTask(index),
          );
        },
      ),
    );
  }
}
