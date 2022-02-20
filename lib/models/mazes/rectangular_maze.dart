import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/mazes/data/data.dart';
import 'package:flutter_application_1/models/sides/rectangular_side.dart';
import 'package:flutter_application_1/models/tiles/rectangular_tile.dart';

class RectangularMaze extends StatefulWidget {
  RectangularMaze(this.mazeData, {Key? key}) : super(key: key);

  late final int width = mazeData.getWidth();
  late final int height = mazeData.getHeight();
  late final mazeConfiguration = mazeData
      .getMazeString()
      .split("\n")
      .where((line) => line.trim().isNotEmpty)
      .toList();

  final MazeData mazeData;

  @override
  State<RectangularMaze> createState() => _RectangularMazeState();
}

class _RectangularMazeState extends State<RectangularMaze> {
  List<List<RectangularTile>> mazeMap = [];
  String currentPosition = "1,1";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1000), () {
      // setState(() {
      //   currentPosition = "2,2";
      // });
    });

    return GestureDetector(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.width,
        itemBuilder: (context, rowIndex) {
          final List<RectangularTile> mazeRow = [];
          final row = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.height, (columnIndex) {
              List<String> tileConfiguration = widget
                  .mazeConfiguration[rowIndex * widget.width + columnIndex]
                  .split(" ")
                  .toList();

              final tile = RectangularTile(
                RectangularSide(
                  up: int.parse(tileConfiguration[0]),
                  right: int.parse(tileConfiguration[1]),
                  down: int.parse(tileConfiguration[2]),
                  left: int.parse(tileConfiguration[3]),
                ),
                currentPosition[0] == rowIndex.toString() &&
                    currentPosition[2] == columnIndex.toString(),
              );

              mazeRow.add(tile);
              return tile;
            }),
          );

          if (mazeRow.isNotEmpty) mazeMap.add(mazeRow);
          return row;
        },
      ),
    );
  }
}
