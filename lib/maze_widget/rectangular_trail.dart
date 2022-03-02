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
  static const _borderSide = BorderSide(color: Colors.red, width: 2);

  double get _getHalfTileSize => tileSize / 2;

  @override
  Widget build(BuildContext context) {
    switch (inDirection) {
      case Direction.up:
        return _getTrailForInDirectionUp();
      case Direction.right:
        return _getTrailForInDirectionRight();
      case Direction.down:
        return _getTrailForInDirectionDown();
      case Direction.left:
        return _getTrailForInDirectionLeft();
      default:
        return _defaultEmptyTrail;
    }
  }

  Widget _getTrailForInDirectionUp() {
    switch (outDirection) {
      case Direction.right:
        return Column(children: [
          SizedBox(width: tileSize, height: _getHalfTileSize),
          Row(
            children: [
              SizedBox(width: _getHalfTileSize, height: _getHalfTileSize),
              Container(
                width: _getHalfTileSize,
                height: _getHalfTileSize,
                decoration: const BoxDecoration(
                    border: Border(left: _borderSide, top: _borderSide)),
              )
            ],
          )
        ]);
      case Direction.left:
        return Column(
          children: [
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(bottom: _borderSide)),
            ),
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(right: _borderSide)),
            ),
          ],
        );
      case Direction.up:
        return Column(
          children: [
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(right: _borderSide)),
            ),
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(right: _borderSide)),
            ),
          ],
        );
      default:
        return _defaultEmptyTrail;
    }
  }

  Widget _getTrailForInDirectionRight() {
    switch (outDirection) {
      case Direction.down:
        return Column(
          children: [
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration: const BoxDecoration(
                border: Border(bottom: _borderSide),
              ),
            ),
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration: const BoxDecoration(
                border: Border(right: _borderSide),
              ),
            ),
          ],
        );
      case Direction.right:
        return Row(
          children: [
            Container(
              width: tileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(bottom: _borderSide)),
            )
          ],
        );
      case Direction.up:
        return Container(
          width: _getHalfTileSize,
          height: _getHalfTileSize,
          decoration: const BoxDecoration(
            border: Border(bottom: _borderSide, right: _borderSide),
          ),
        );
      default:
        return _defaultEmptyTrail;
    }
  }

  Widget _getTrailForInDirectionLeft() {
    switch (outDirection) {
      case Direction.down:
        return Column(
          children: [
            Row(
              children: [
                SizedBox(width: _getHalfTileSize, height: _getHalfTileSize),
                Container(
                  width: _getHalfTileSize,
                  height: _getHalfTileSize,
                  decoration: const BoxDecoration(
                    border: Border(bottom: _borderSide),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: _getHalfTileSize,
                  height: _getHalfTileSize,
                  decoration: const BoxDecoration(
                    border: Border(right: _borderSide),
                  ),
                ),
                SizedBox(width: _getHalfTileSize, height: _getHalfTileSize)
              ],
            ),
          ],
        );
      case Direction.left:
        return Row(
          children: [
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(bottom: _borderSide)),
            ),
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(bottom: _borderSide)),
            ),
          ],
        );
      case Direction.up:
        return Row(
          children: [
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(right: _borderSide)),
            ),
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(bottom: _borderSide)),
            ),
          ],
        );
      default:
        return _defaultEmptyTrail;
    }
  }

  Widget _getTrailForInDirectionDown() {
    switch (outDirection) {
      case Direction.down:
        return Column(
          children: [
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(right: _borderSide)),
            ),
            Container(
              width: _getHalfTileSize,
              height: _getHalfTileSize,
              decoration:
                  const BoxDecoration(border: Border(right: _borderSide)),
            ),
          ],
        );
      case Direction.left:
        return Container(
          width: _getHalfTileSize,
          height: _getHalfTileSize,
          decoration: const BoxDecoration(
            border: Border(
              right: _borderSide,
              bottom: _borderSide,
            ),
          ),
        );
      case Direction.right:
        return Row(children: [
          Container(
            width: _getHalfTileSize,
            height: _getHalfTileSize,
            decoration: const BoxDecoration(border: Border(right: _borderSide)),
          ),
          Container(
            width: _getHalfTileSize,
            height: _getHalfTileSize,
            decoration:
                const BoxDecoration(border: Border(bottom: _borderSide)),
          ),
        ]);
      default:
        return _defaultEmptyTrail;
    }
  }
}
