import 'package:flutter/material.dart';
import 'package:slidiv/common/enum/direction_enum.dart';

class RectangularTrail extends StatelessWidget {
  RectangularTrail({
    required this.tileSize,
    required this.inDirection,
    required this.outDirection,
    Key? key,
  }) : super(key: key);

  final double tileSize;
  final Direction inDirection;
  final Direction outDirection;

  late final SizedBox _defaultEmptyTrail =
      SizedBox(width: tileSize, height: tileSize);

  double get _getHalfTileSize => tileSize / 2;

  static const _verticalDivider = VerticalDivider(
    thickness: 2,
    color: Colors.red,
  );

  static const _horizontalDivider = Divider(
    thickness: 2,
    color: Colors.red,
  );

  late final Widget _halfVerticalTop = SizedBox(
    width: tileSize,
    height: _getHalfTileSize,
    child: _verticalDivider,
  );

  late final Widget _halfVerticalBottom = SizedBox(
    width: tileSize,
    height: tileSize,
    child: Column(
      verticalDirection: VerticalDirection.up,
      children: [
        SizedBox(
          width: tileSize,
          height: _getHalfTileSize,
          child: _verticalDivider,
        )
      ],
    ),
  );

  late final Widget _halfHorizontalLeft = SizedBox(
    width: _getHalfTileSize,
    height: tileSize,
    child: _horizontalDivider,
  );

  late final Widget _halfHorizontalRight = SizedBox(
    width: tileSize,
    height: tileSize,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: _getHalfTileSize,
          height: tileSize,
          child: _horizontalDivider,
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    switch (inDirection) {
      case Direction.up:
        return Stack(
          children: [
            _halfVerticalBottom,
            _getTrailForInDirectionUp(),
          ],
        );
      case Direction.right:
        return Stack(
          children: [
            _halfHorizontalLeft,
            _getTrailForInDirectionRight(),
          ],
        );
      case Direction.down:
        return Stack(
          children: [
            _halfVerticalTop,
            _getTrailForInDirectionDown(),
          ],
        );
      case Direction.left:
        return Stack(
          children: [
            _halfHorizontalRight,
            _getTrailForInDirectionLeft(),
          ],
        );
      default:
        return _defaultEmptyTrail;
    }
  }

  Widget _getTrailForInDirectionUp() {
    switch (outDirection) {
      case Direction.right:
        return _halfHorizontalRight;
      case Direction.left:
        return _halfHorizontalLeft;
      case Direction.up:
        return _halfVerticalTop;
      default:
        return _defaultEmptyTrail;
    }
  }

  Widget _getTrailForInDirectionRight() {
    switch (outDirection) {
      case Direction.down:
        return _halfVerticalBottom;
      case Direction.right:
        return _halfHorizontalRight;
      case Direction.up:
        return _halfVerticalTop;
      default:
        return _defaultEmptyTrail;
    }
  }

  Widget _getTrailForInDirectionLeft() {
    switch (outDirection) {
      case Direction.down:
        return _halfVerticalBottom;
      case Direction.left:
        return _halfHorizontalLeft;
      case Direction.up:
        return _halfVerticalTop;
      default:
        return _defaultEmptyTrail;
    }
  }

  Widget _getTrailForInDirectionDown() {
    switch (outDirection) {
      case Direction.down:
        return _halfVerticalBottom;
      case Direction.left:
        return _halfHorizontalLeft;
      case Direction.right:
        return _halfHorizontalRight;
      default:
        return _defaultEmptyTrail;
    }
  }
}
