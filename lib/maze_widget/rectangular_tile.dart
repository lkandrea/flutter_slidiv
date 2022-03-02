import 'package:flutter/material.dart';
import 'package:slidiv/common/enum/direction_enum.dart';
import 'package:slidiv/common/enum/screen_size_enum.dart';
import 'package:slidiv/common/widgets/responsive_container_widget.dart';
import 'package:slidiv/maze_widget/rectangular_side.dart';
import 'package:slidiv/maze_widget/rectangular_trail.dart';

class RectangularTile extends StatelessWidget {
  RectangularTile({
    required this.tileConfiguration,
    required this.occupied,
    required this.tileColor,
    required this.inDirection,
    required this.outDirection,
    Key? key,
  }) : super(key: key);

  final List<String> tileConfiguration;
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
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: (context, screenSize) {
        final double _tileSize;

        switch (screenSize) {
          case ScreenSize.small:
            _tileSize = 30.0;
            break;
          case ScreenSize.large:
            _tileSize = 50.0;
            break;
        }

        return Stack(
          children: [
            Container(
              width: _tileSize,
              height: _tileSize,
              color: tileColor,
              child: Stack(
                children: [
                  Visibility(
                    visible: occupied,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: _tileSize,
              height: _tileSize,
              decoration: BoxDecoration(
                border: Border(
                  bottom: _createBorder(side.down),
                  left: _createBorder(side.left),
                  right: _createBorder(side.right),
                  top: _createBorder(side.up),
                ),
              ),
            ),
            Visibility(
              visible: !occupied &&
                  inDirection != null &&
                  outDirection != null,
              child: RectangularTrail(
                tileSize: _tileSize,
                inDirection: inDirection ?? Direction.none,
                outDirection: outDirection ?? Direction.none,
              ),
            ),
          ],
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
