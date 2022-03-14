import 'package:flutter/material.dart';
import 'package:slidiv/common/enum/direction_enum.dart';
import 'package:slidiv/common/enum/screen_size_enum.dart';
import 'package:slidiv/common/widgets/responsive_container_widget.dart';
import 'package:slidiv/data/maze_data.dart';
import 'package:slidiv/data/rectangular_maze_15x15_data.dart';
import 'package:slidiv/data/rectangular_maze_7x7_data.dart';
import 'package:slidiv/maze_widget/rectangular_side.dart';
import 'package:slidiv/maze_widget/rectangular_trail.dart';

class RectangularTile extends StatefulWidget {
  RectangularTile({
    required this.mazeData,
    required this.tileConfiguration,
    required this.prevOccupied,
    required this.occupied,
    required this.tileColor,
    required this.inDirection,
    required this.outDirection,
    Key? key,
  }) : super(key: key);

  final MazeData mazeData;
  final List<String> tileConfiguration;
  final bool prevOccupied;
  final bool occupied;
  final Color tileColor;
  final Direction? inDirection;
  final Direction? outDirection;

  late final RectangularSide side = RectangularSide(
    up: int.parse(tileConfiguration[0]),
    right: int.parse(tileConfiguration[1]),
    down: int.parse(tileConfiguration[2]),
    left: int.parse(tileConfiguration[3]),
  );

  @override
  State<RectangularTile> createState() => _RectangularTileState();
}

class _RectangularTileState extends State<RectangularTile> {
  bool isAnimationFinished = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: (context, screenSize) {
        final double _tileSize;
        final double _divisionMultiplier;

        switch (widget.mazeData.runtimeType) {
          case RectangularMaze7x7:
            _divisionMultiplier = 1;
            break;
          case RectangularMaze15x15:
            _divisionMultiplier = 1.5;
            break;
          default:
            _divisionMultiplier = 1;
        }

        switch (screenSize) {
          case ScreenSize.small:
            _tileSize = 30.0 / _divisionMultiplier;
            break;
          case ScreenSize.large:
            _tileSize = 50.0 / _divisionMultiplier;
            break;
        }

        return Stack(
          children: [
            Container(
              width: _tileSize,
              height: _tileSize,
              color: widget.tileColor,
            ),
            Container(
              width: _tileSize,
              height: _tileSize,
              decoration: BoxDecoration(
                border: Border(
                  bottom: _createBorder(widget.side.down),
                  left: _createBorder(widget.side.left),
                  right: _createBorder(widget.side.right),
                  top: _createBorder(widget.side.up),
                ),
              ),
            ),
            Visibility(
              visible: isAnimationFinished && !widget.occupied,
              child: RectangularTrail(
                tileSize: _tileSize,
                inDirection: widget.inDirection,
                outDirection: widget.outDirection,
              ),
            ),
            Visibility(
              visible: widget.occupied || widget.prevOccupied,
              child: _createPositionIndicator(_tileSize),
            ),
          ],
        );
      },
    );
  }

  Widget _createPositionIndicator(double _tileSize) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 150),
      tween: Tween(
        begin: widget.prevOccupied ? 0.0 : _tileSize,
        end: widget.prevOccupied ? _tileSize : 0.0,
      ),
      curve: Curves.ease,
      onEnd: () {
        setState(() {
          isAnimationFinished = true;
        });
      },
      child: Stack(
        children: [
          RectangularTrail(
            tileSize: _tileSize,
            inDirection: widget.occupied ? widget.inDirection : null,
            outDirection: null,
            trailDivider: 3,
          ),
          Container(
            width: _tileSize - 16.0,
            height: _tileSize - 16.0,
            margin: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Container(
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.tileColor,
              ),
              child: Container(
                margin: const EdgeInsets.all(2.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
      builder: (BuildContext context, Object? value, Widget? child) {
        double? _offsetValue = value as double;
        double? _offsetLeft;
        double? _offsetRight;
        double? _offsetTop;
        double? _offsetBottom;

        if (widget.occupied) {
          switch (widget.inDirection) {
            case Direction.up:
              _offsetTop = _offsetValue;
              break;
            case Direction.right:
              _offsetRight = _offsetValue;
              break;
            case Direction.down:
              _offsetBottom = _offsetValue;
              break;
            case Direction.left:
              _offsetLeft = _offsetValue;
              break;
            case Direction.none:
              break;
            case null:
              break;
          }
        }

        if (widget.prevOccupied) {
          switch (widget.outDirection) {
            case Direction.up:
              _offsetBottom = _offsetValue;
              break;
            case Direction.right:
              _offsetLeft = _offsetValue;
              break;
            case Direction.down:
              _offsetTop = _offsetValue;
              break;
            case Direction.left:
              _offsetRight = _offsetValue;
              break;
            case Direction.none:
              break;
            case null:
              break;
          }
        }

        return Positioned(
          left: _offsetLeft,
          right: _offsetRight,
          top: _offsetTop,
          bottom: _offsetBottom,
          child: child ?? Container(),
        );
      },
    );
  }

  BorderSide _createBorder(int borderSide) {
    if (borderSide != 1) {
      return const BorderSide(color: Colors.black);
    } else {
      return BorderSide.none;
    }
  }

  double inverse(int num) {
    if (num == 1) {
      return 0;
    }
    return 1;
  }
}
