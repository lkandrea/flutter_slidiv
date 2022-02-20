import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/mazes/data/data.dart';
import 'package:flutter_application_1/models/movements/rectangular_movement.dart';
import 'package:flutter_application_1/models/sides/rectangular_side.dart';
import 'package:flutter_application_1/models/tiles/rectangular_tile.dart';

class RectangularMaze extends StatelessWidget {
  RectangularMaze({Key? key}) : super(key: key) {
    lastValidMovement = null;
  }

  final int width = 7;
  final int height = 7;
  final mazeConfiguration = RectangularMaze_7x7()
      .getMazeString()
      .split("\n")
      .where((line) => line.trim().isNotEmpty)
      .toList();

  late final RectangularMovement? lastValidMovement;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: width,
      itemBuilder: (context, rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(height, (columnIndex) {
            List<String> tileConfiguration =
                mazeConfiguration[rowIndex * width + columnIndex]
                    .split(" ")
                    .toList();

            return RectangularTile(
              RectangularSide(
                up: int.parse(tileConfiguration[0]),
                right: int.parse(tileConfiguration[1]),
                down: int.parse(tileConfiguration[2]),
                left: int.parse(tileConfiguration[3]),
              ),
              tileConfiguration.last == 'i',
            );
          }),
        );
      },
    );
  }

  // RectangularMaze moveCurrentTile(RectangularMovement movement) {
  //   if (currentTile.getPossibleMoves(lastValidMovement).contains(movement)) {
  //     tiles.setAll(currentTileIndex, [currentTile.leave()]);
  //     RectangularTile nextTile = getNextTile(movement);
  //     tiles.setAll(tiles.indexOf(nextTile), [nextTile.occupy()]);
  //
  //     return RectangularMaze(
  //       width,
  //       height,
  //       tiles,
  //       movement,
  //     );
  //   }
  //   return this;
  // }

  // RectangularTile getNextTile(RectangularMovement movement) {
  //   if (movement == RectangularMovement.up) {
  //     return tiles.elementAt(currentTileIndex - width);
  //   }
  //   if (movement == RectangularMovement.right) {
  //     return tiles.elementAt(currentTileIndex + 1);
  //   }
  //   if (movement == RectangularMovement.down) {
  //     return tiles.elementAt(currentTileIndex + width);
  //   }
  //   return tiles.elementAt(currentTileIndex - 1);
  // }

}
