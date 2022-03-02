import 'package:flutter/material.dart';
import 'package:slidiv/common/constant/hero_constants.dart';
import 'package:slidiv/common/extensions/double_extension.dart';
import 'package:slidiv/common/enum/direction_enum.dart';
import 'package:slidiv/common/extensions/maze_data_extension.dart';
import 'package:slidiv/common/style/slidiv_bold_text.dart';
import 'package:slidiv/data/maze_data.dart';
import 'package:slidiv/maze_widget/rectangular_tile.dart';

class RectangularMaze extends StatefulWidget {
  RectangularMaze(this.mazeData, {Key? key}) : super(key: key);

  final MazeData mazeData;

  late final width = mazeData.getWidth();
  late final height = mazeData.getHeight();
  late final initialX = mazeData.getInitialX();
  late final initialY = mazeData.getInitialY();
  late final mazeConfiguration = mazeData.toList();

  @override
  State<RectangularMaze> createState() => _RectangularMazeState();
}

class _RectangularMazeState extends State<RectangularMaze> {
  final List<List<RectangularTile>> _mazeMap = [];
  final _mazeColor = Colors.green.shade100;

  late final List<List<Direction?>> _mazeMoveInDirections = _initMazeMoveInDirections();
  late final List<List<Direction?>> _mazeMoveOutDirections = _initMazeMoveOutDirections();
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
      child: Container(
        color: Colors.grey.shade300,
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Hero(
              tag: HeroConstants.slidivTitle,
              child: Text(
                "Slidiv",
                style: SlidivBoldText(),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(32.0),
              itemCount: widget.width,
              itemBuilder: (context, rowIndex) {
                final List<RectangularTile> mazeRow = [];
                final row = Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.height, (columnIndex) {
                    List<String> tileConfiguration = widget.mazeConfiguration[
                            rowIndex * widget.width + columnIndex]
                        .split(" ")
                        .toList();

                    final tile = RectangularTile(
                      tileConfiguration: tileConfiguration,
                      occupied:
                          _currentX == columnIndex && _currentY == rowIndex,
                      tileColor: _mazeColor,
                      inDirection: _mazeMoveInDirections[rowIndex][columnIndex],
                      outDirection: _mazeMoveOutDirections[rowIndex][columnIndex],
                    );

                    final startColor =
                        (widget.mazeData.getInitialY() == rowIndex &&
                                widget.mazeData.getInitialX() == columnIndex)
                            ? Colors.red.withOpacity(0.5)
                            : null;

                    final endColor =
                        (widget.mazeData.getFinishY() == rowIndex &&
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
          ],
        ),
      ),
    );
  }

  void _checkMovement() {
    final _movement = _parseMovement();
    final _currentTile = _mazeMap[_currentY][_currentX];
    final _currentBlankSide = _currentTile.side.getBlankSides();

    if (_currentBlankSide.contains(_movement)) {
      switch (_movement) {
        case Direction.up:
          if (_mazeMoveInDirections[_currentY - 1][_currentX] == null) {
            setState(() {
              _mazeMoveOutDirections[_currentY][_currentX] = _movement;
              _mazeMoveInDirections[_currentY - 1][_currentX] = _movement;
              _currentY--;
            });
          }
          break;
        case Direction.right:
          if (_mazeMoveInDirections[_currentY][_currentX + 1] == null) {
            setState(() {
              _mazeMoveOutDirections[_currentY][_currentX] = _movement;
              _mazeMoveInDirections[_currentY][_currentX + 1] = _movement;
              _currentX++;
            });
          }
          break;
        case Direction.down:
          if (_mazeMoveInDirections[_currentY + 1][_currentX] == null) {
            setState(() {
              _mazeMoveOutDirections[_currentY][_currentX] = _movement;
              _mazeMoveInDirections[_currentY + 1][_currentX] = _movement;
              _currentY++;
            });
          }
          break;
        case Direction.left:
          if (_mazeMoveInDirections[_currentY][_currentX - 1] == null) {
            setState(() {
              _mazeMoveOutDirections[_currentY][_currentX] = _movement;
              _mazeMoveInDirections[_currentY][_currentX - 1] = _movement;
              _currentX--;
            });
          }
          break;
        case Direction.none:
          break;
      }
    }
  }

  Direction _parseMovement() {
    final _deltaX =
        (panPositionStart?.dx).orZero() - (panPositionDown?.dx).orZero();
    final _deltaY =
        (panPositionStart?.dy).orZero() - (panPositionDown?.dy).orZero();

    if (_deltaX >= 0) {
      if (_deltaX.abs() > _deltaY.abs()) {
        return Direction.right;
      } else if (_deltaY < 0) {
        return Direction.up;
      } else if (_deltaY > 0) {
        return Direction.down;
      }
    } else if (_deltaX < 0) {
      if (_deltaX.abs() > _deltaY.abs()) {
        return Direction.left;
      } else if (_deltaY < 0) {
        return Direction.up;
      } else if (_deltaY > 0) {
        return Direction.down;
      }
    }

    return Direction.none;
  }

  List<List<Direction?>> _initMazeMoveInDirections() {
    return List.generate(
        widget.height,
        (rowIndex) => List.generate(
          widget.width, 
          (columnIndex) {
            if (rowIndex == widget.initialY && columnIndex == widget.initialX) {
              return Direction.down;
            }
            return null;
          },
        ),
      );
  }

  List<List<Direction?>> _initMazeMoveOutDirections() {
    return List.generate(
        widget.height,
        (rowIndex) => List.generate(
          widget.width, 
          (columnIndex) => null
        ),
      );
  }
}
