import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/main_page.dart';

void main() async {
  //initialize the hive
  await Hive.initFlutter();

  //open a box
  // ignore: unused_local_variable
  var myBox = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Todo App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MainPage(),
    );
  }
}