import 'package:flutter/material.dart';
import 'package:slidiv/data/rectangular_maze_7x7_data.dart';
import 'package:slidiv/maze_widget/rectangular_maze.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RectangularMaze(RectangularMaze7x7()),
    );
  }
}
