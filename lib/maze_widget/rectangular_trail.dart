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
    return Stack(
      children: [
        Visibility(
          visible:
              inDirection == Direction.right || outDirection == Direction.left,
          child: _halfHorizontalLeft,
        ),
        Visibility(
          visible:
              inDirection == Direction.left || outDirection == Direction.right,
          child: _halfHorizontalRight,
        ),
        Visibility(
          visible:
              inDirection == Direction.down || outDirection == Direction.up,
          child: _halfVerticalTop,
        ),
        Visibility(
          visible:
              inDirection == Direction.up || outDirection == Direction.down,
          child: _halfVerticalBottom,
        ),
      ],
    );
  }
}
