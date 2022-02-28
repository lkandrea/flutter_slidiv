import 'package:flutter/material.dart';
import 'package:slidiv/common/navigation/navigation_util.dart';
import 'package:slidiv/data/rectangular_maze_7x7_data.dart';
import 'package:slidiv/maze_widget/rectangular_maze.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleStartMaze(context),
      child: Text("Start"),
    );
  }

  void _handleStartMaze(BuildContext context) {
    final _mazeData = RectangularMaze7x7();
    final _mazeMap = RectangularMaze(_mazeData);

    NavigationUtil.push(context, _mazeMap);
  }
}
