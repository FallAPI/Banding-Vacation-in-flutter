import 'package:first_project/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_project/detail_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Wisata Bandung",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MainScreen(),
    );
  }
}


