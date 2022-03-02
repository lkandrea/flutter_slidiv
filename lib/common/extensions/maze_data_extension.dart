import 'package:slidiv/data/maze_data.dart';

extension MazeDataExt on MazeData {
  List<String> toList() {
    return getMazeString()
        .split("\n")
        .where((line) => line.trim().isNotEmpty)
        .toList();
  }
}
