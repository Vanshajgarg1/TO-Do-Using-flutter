import 'package:hive_flutter/hive_flutter.dart';
class ToDoDataBase{
  List ToDoList = [];
  // reference our box
  final _mybox = Hive.box('myBox');

  // run this method if the person is  new in the app
  void createInitialData() {
    ToDoList = [
      ['right your task 1' , false],
      ['right your task 2' , false] ,
    ];
  }
  // load the data from the database
   void loadData(){
    ToDoList =_mybox.get('TODOLIST');
   }
// update the database
void updateDataBase(){
    _mybox.put("TODOLIST", ToDoList);
}
}
