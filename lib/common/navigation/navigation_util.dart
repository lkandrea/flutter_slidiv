import 'package:flutter/material.dart';
import 'package:slidiv/data/rectangular_maze_15x15_data.dart';
import 'package:slidiv/data/rectangular_maze_7x7_data.dart';
import 'package:slidiv/maze_widget/rectangular_maze.dart';

class NavigationUtil {
  void navigateToLevelOne(BuildContext context) {
    final _mazeData = RectangularMaze7x7();
    final _mazeMap = RectangularMaze(_mazeData);

    _push(context, SafeArea(child: _mazeMap));
  }

  void navigateToLevelTwo(BuildContext context) {
    final _mazeData = RectangularMaze15x15();
    final _mazeMap = RectangularMaze(_mazeData);

    _push(context, SafeArea(child: _mazeMap));
  }

  void _push(BuildContext context, Widget destination) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return destination;
    }));
  }
}
