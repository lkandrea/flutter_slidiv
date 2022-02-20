import 'package:flutter_application_1/models/mazes/data/maze_data.dart';

// ignore: camel_case_types
class RectangularMaze_7x7 implements MazeData {

  @override
  int getWidth() {
    return 7;
  }

  @override
  int getHeight() {
    return 7;
  }

  @override
  int getFinishX() {
    return 6;
  }

  @override
  int getFinishY() {
    return 3;
  }

  @override
  int getInitialX() {
    return 0;
  }

  @override
  int getInitialY() {
    return 3;
  }

  @override
  String getMazeString() {
    return """0 1 1 0
0 1 0 1
0 1 1 1
1 1 0 1
0 1 0 1
0 0 1 1
0 0 1 0
1 1 0 0
0 0 1 1
1 1 0 0
0 1 0 1
0 0 1 1
1 1 0 0
1 0 1 1
0 1 1 0
1 0 0 1
0 1 1 0
0 0 1 1
1 0 1 0
0 1 1 0
1 0 0 1
1 0 0 0
0 1 1 0
1 0 1 1
1 1 0 0
1 0 0 1
1 1 0 0
0 0 1 1
0 1 1 0
1 0 0 1
1 1 0 0
0 0 1 1
0 1 1 0
0 1 0 1
1 0 0 1
1 0 1 0
0 1 0 0
0 1 0 1
1 0 0 1
1 0 1 0
0 1 0 0
0 0 1 1
1 1 0 0
0 1 0 1
0 1 0 1
0 0 1 1
1 1 0 0
0 1 0 1
1 0 0 1""";
  }
}
