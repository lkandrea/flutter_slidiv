import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/extensions/extension_double.dart';
import 'package:flutter_application_1/models/mazes/data/data.dart';
import 'package:flutter_application_1/models/movements/rectangular_movement.dart';
import 'package:flutter_application_1/models/sides/rectangular_side.dart';
import 'package:flutter_application_1/models/tiles/rectangular_tile.dart';

class RectangularMaze extends StatefulWidget {
  RectangularMaze(this.mazeData, {Key? key}) : super(key: key);

  late final int width = mazeData.getWidth();
  late final int height = mazeData.getHeight();
  late final int initialX = mazeData.getInitialX();
  late final int initialY = mazeData.getInitialY();

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
  final List<List<RectangularTile>> _mazeMap = [];
  final _mazeColor = Colors.green.shade100;

  late final List<List<RectangularMovement?>> _mazeMovements = _initMazeMovements();
  late int _currentX = widget.initialX;
  late int _currentY = widget.initialY;

  Offset? panPositionDown;
  Offset? panPositionStart;

  @override
  Widget build(BuildContext context) {
    _mazeMap.clear();

    return GestureDetector(
      onTap: () {},
      onPanDown: (panDownDetails) {
        panPositionDown = panDownDetails.localPosition;
      },
      onPanStart: (panStartDetails) {
        panPositionStart = panStartDetails.localPosition;
        _checkMovement();
      },
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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
                side: RectangularSide(
                  up: int.parse(tileConfiguration[0]),
                  right: int.parse(tileConfiguration[1]),
                  down: int.parse(tileConfiguration[2]),
                  left: int.parse(tileConfiguration[3]),
                ),
                occupied: _currentX == columnIndex && _currentY == rowIndex,
                tileColor: _mazeColor,
                  _mazeMovements[rowIndex][columnIndex]
              );

              final startColor = (widget.mazeData.getInitialY() == rowIndex &&
                      widget.mazeData.getInitialX() == columnIndex)
                  ? Colors.red.withOpacity(0.5)
                  : null;

              final endColor = (widget.mazeData.getFinishY() == rowIndex &&
                  widget.mazeData.getFinishX() == columnIndex)
                  ? Colors.blue.withOpacity(0.5)
                  : null;

              mazeRow.add(tile);
              return Container(
                color: _mazeColor,
                foregroundDecoration: BoxDecoration(
                  color: startColor ?? endColor,
                ),
                child: tile,
              );
            }),
          );

          if (mazeRow.isNotEmpty) _mazeMap.add(mazeRow);
          return row;
        },
      ),
    );
  }

  void _checkMovement() {
    final _movement = _parseMovement();
    final _currentTile = _mazeMap[_currentY][_currentX];
    final _currentBlankSide = _currentTile.side.getBlankSides();

    if (_currentBlankSide.contains(_movement)) {
      switch (_movement) {
        case RectangularMovement.up:
          if (_mazeMovements[_currentY - 1][_currentX] == null) {
            setState(() {
              _mazeMovements[_currentY - 1][_currentX] = _movement;
              _currentY--;
            });
          }
          break;
        case RectangularMovement.right:
          if (_mazeMovements[_currentY][_currentX + 1] == null) {
            setState(() {
              _mazeMovements[_currentY][_currentX + 1] = _movement;
              _currentX++;
            });
          }
          break;
        case RectangularMovement.down:
          if (_mazeMovements[_currentY + 1][_currentX] == null) {
            setState(() {
              _mazeMovements[_currentY + 1][_currentX] = _movement;
              _currentY++;
            });
          }
          break;
        case RectangularMovement.left:
          if (_mazeMovements[_currentY][_currentX - 1] == null) {
            setState(() {
              _mazeMovements[_currentY][_currentX - 1] = _movement;
              _currentX--;
            });
          }
          break;
      }
    }
  }

  RectangularMovement _parseMovement() {
    final _deltaX =
        (panPositionStart?.dx).orZero() - (panPositionDown?.dx).orZero();
    final _deltaY =
        (panPositionStart?.dy).orZero() - (panPositionDown?.dy).orZero();

    if (_deltaX > 0) {
      if (_deltaX.abs() > _deltaY.abs()) {
        return RectangularMovement.right;
      } else if (_deltaY < 0) {
        return RectangularMovement.up;
      } else if (_deltaY > 0) {
        return RectangularMovement.down;
      }
    } else if (_deltaX < 0) {
      if (_deltaX.abs() > _deltaY.abs()) {
        return RectangularMovement.left;
      } else if (_deltaY < 0) {
        return RectangularMovement.up;
      } else if (_deltaY > 0) {
        return RectangularMovement.down;
      }
    }

    return RectangularMovement.right;
  }

  List<List<RectangularMovement?>> _initMazeMovements() {
    return List.generate(
      widget.height,
      (i) => List.generate(
        widget.width,
        (j) {
          if (i == _currentY && j == _currentX) {
            return RectangularMovement.down;
          }
          return null;
        }
      )
    );
  }
}
