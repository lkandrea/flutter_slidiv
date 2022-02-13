import 'package:flutter_application_1/models/mazes/data/maze_data.dart';

// ignore: camel_case_types
class RectangularMaze_7x7 implements MazeData {

  @override
  String getMazeString() {
    return """0 1 1 0
0 1 0 1
0 1 1 1
1 1 0 1 i
0 1 0 1
0 0 1 1
0 0 1 0
1 1 0 0
0 0 1 1
1 1 0 0
0 1 0 1
0 0 1 1
1 1 0 0
1 1 1 1
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
1 0 1 0
1 0 1 0
0 0 1 1 o
1 1 0 0
1 0 1 0
1 0 0 1""";
  }

  @override
  int getWidth() {
    return 7;
  }

  @override
  int getHeight() {
    return 7;
  }
}
