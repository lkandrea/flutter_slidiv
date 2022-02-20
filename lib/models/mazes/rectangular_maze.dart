import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/mazes/data/data.dart';
import 'package:flutter_application_1/models/movements/rectangular_movement.dart';
import 'package:flutter_application_1/models/sides/rectangular_side.dart';
import 'package:flutter_application_1/models/tiles/rectangular_tile.dart';

class RectangularMaze extends StatelessWidget {
  RectangularMaze({Key? key}) : super(key: key) {
    lastValidMovement = null;
  }

  late final int width = 7;
  late final int height = 7;
  late final RectangularMovement? lastValidMovement;

  @override
  Widget build(BuildContext context) {
    final mazeData = RectangularMaze_7x7();
    final mazeTiles = mazeData
        .getMazeString()
        .split("\n")
        .where((line) => line.trim().isNotEmpty)
        .map((line) {
      List<String> sideConfigurations = line.split(" ").toList();

      return RectangularTile(
        side: RectangularSide(
          up: int.parse(sideConfigurations[0]),
          right: int.parse(sideConfigurations[1]),
          down: int.parse(sideConfigurations[2]),
          left: int.parse(sideConfigurations[3]),
        ),
        occupied:
            sideConfigurations.length == 5 && sideConfigurations[4] == 'i',
      );
    }).toList();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: mazeTiles.length,
      itemBuilder: (context, index) {
        if (index % width == 0) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              width,
              (rowIndex) {
                RectangularTile tile = mazeTiles.elementAt(index + rowIndex);
                RectangularSide tileSide = tile.side;

                return Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: hasBorder(tileSide.down)
                            ? BorderSide(width: inverse(tileSide.down))
                            : BorderSide.none,
                        left: hasBorder(tileSide.left)
                            ? BorderSide(width: inverse(tileSide.left))
                            : BorderSide.none,
                        right: hasBorder(tileSide.right)
                            ? BorderSide(width: inverse(tileSide.right))
                            : BorderSide.none,
                        top: hasBorder(tileSide.up)
                            ? BorderSide(width: inverse(tileSide.up))
                            : BorderSide.none),
                    color: Colors.green[100],
                  ),
                  child: Visibility(
                    visible: tile.occupied,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return Container();
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

  double inverse(int num) {
    if (num == 1) {
      return 0;
    }
    return 1;
  }

  bool hasBorder(int num) {
    return num != 1;
  }
}
