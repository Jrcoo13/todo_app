import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');

  @override
  void initState() {
    // if this is the first time ever opening or use this app, then create a default data
    // use the initial database for new user
    if(_myBox.get('TODOLIST') == null) {
      db.createInitialDatabase();
    }
    else {
      // load the already exists data
      db.loadDatabase();
    }
    super.initState();
  }

  //instance of the tododabase class to store data
  TodoDatabase db = TodoDatabase();
  //text controller
  final controller = TextEditingController();

  //list if todo

  //checkbox changed 
  void isCompleted(bool? value, int index){
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateDatabase();
  }
  //save the created task 
  void saveTask(){
    setState(() {
      db.todolist.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }
  //delete the task
  void deleteTask(int index){
    setState(() {
      db.todolist.removeAt(index);
      db.updateDatabase();
    });
  }
  //create a new todo task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: controller,
          onSave: saveTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('TO DO'),
        backgroundColor: Colors.grey[200],
        elevation: 1,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[400],
        onPressed: () => createNewTask(),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: db.todolist[index][0],
          taskCompleted: db.todolist[index][1],
          onChanged: (value) => isCompleted(value, index),
          deleteTask: (context) => deleteTask(index),
        ),
      ),
    );
  }
}
