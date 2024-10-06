import 'package:hive/hive.dart';

class TodoDatabase {

List todolist = [];



  //reference the box
  final _mybox = Hive.box('mybox');

  //run this method if this is the 1st time ever opening this app
  void createInitialDatabase() {
    todolist = [
      ['Welcome To My App', false],
    ];
  }

  //load the data from the database
  void loadDatabase() {
    todolist = _mybox.get('TODOLIST');
  }

  //update the database
  void updateDatabase() {
    _mybox.put('TODOLIST', todolist);
  }
}