// main.dart
import 'package:classico/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  // init the hive
await Hive.initFlutter();
  runApp(const MyApp());

// open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home_page(),
      theme: ThemeData(primarySwatch:Colors.blue ),


    );
  }
}



