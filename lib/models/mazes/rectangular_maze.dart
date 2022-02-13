import 'package:flutter_application_1/models/mazes/data/maze_data.dart';
import 'package:flutter_application_1/models/movements/rectangular_movement.dart';
import 'package:flutter_application_1/models/sides/rectangular_side.dart';
import 'package:flutter_application_1/models/tiles/rectangular_tile.dart';

class RectangularMaze {
  const RectangularMaze({required this.width, required this.height, required this.tiles, required this.lastValidMovement});

  final int width;

  final int height;

  final List<RectangularTile> tiles;

  final RectangularMovement? lastValidMovement;

  RectangularTile get currentTile => tiles.firstWhere((tile) => tile.occupied);

  int get currentTileIndex => tiles.indexOf(currentTile);

  // TODO Render UI after creating maze
  static RectangularMaze create(MazeData mazeData) {
    List<RectangularTile> tiles = mazeData.getMazeString()
      .split("\n")
      .where((line) => line.trim().isNotEmpty)
      .map((line) {
        List<String> sideConfigurations = line.split(" ")
          .toList();

        return RectangularTile(
          side: RectangularSide(
            up: int.parse(sideConfigurations[0]), 
            right: int.parse(sideConfigurations[1]), 
            down: int.parse(sideConfigurations[2]), 
            left: int.parse(sideConfigurations[3])
          ),
          occupied: sideConfigurations.length == 5 && sideConfigurations[4] == 'i'
        );
      })
      .toList();
    
    return RectangularMaze(width: mazeData.getWidth(), height: mazeData.getHeight(), tiles: tiles, lastValidMovement: null);
  }

  RectangularMaze moveCurrentTile(RectangularMovement movement) {
    if (currentTile.getPossibleMoves(lastValidMovement).contains(movement)) {
      tiles.setAll(currentTileIndex, [currentTile.leave()]);
      RectangularTile nextTile = getNextTile(movement);
      tiles.setAll(tiles.indexOf(nextTile), [nextTile.occupy()]);
      
      return RectangularMaze(width: width, height: height, tiles: tiles, lastValidMovement: movement);
    }
    return this;
  }

  RectangularTile getNextTile(RectangularMovement movement) {
    if (movement == RectangularMovement.up) {
      return tiles.elementAt(currentTileIndex - width);
    }
    if (movement == RectangularMovement.right) {
      return tiles.elementAt(currentTileIndex + 1);
    }
    if (movement == RectangularMovement.down) {
      return tiles.elementAt(currentTileIndex + width);
    }
    return tiles.elementAt(currentTileIndex - 1);
  }
}
