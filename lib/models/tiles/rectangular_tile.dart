import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sides/sides.dart';

class RectangularTile extends StatefulWidget {
  const RectangularTile(this.side, this.initOccupied, {Key? key})
      : super(key: key);

  final RectangularSide side;
  final bool initOccupied;

  @override
  State<RectangularTile> createState() => _RectangularTileState();
}

class _RectangularTileState extends State<RectangularTile> {
  final _tileWidth = 50.0;
  final _tileHeight = 50.0;
  bool? occupied;

  //
  // List<RectangularMovement> getPossibleMoves(
  //     RectangularMovement? lastValidMovement) {
  //   if ((occupied ?? widget.initOccupied) && lastValidMovement != null) {
  //     List<RectangularMovement> blankSides = widget.side.getBlankSides();
  //     blankSides.remove(lastValidMovement.getOpposite());
  //     return blankSides;
  //   }
  //   return [];
  // }

  // RectangularTile occupy() {
  //   return RectangularTile(side: widget.side, initOccupied: true);
  // }
  //
  // RectangularTile leave() {
  //   return RectangularTile(side: widget.side, occupied: false);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _tileWidth,
      height: _tileHeight,
      decoration: BoxDecoration(
        border: Border(
            bottom: hasBorder(widget.side.down)
                ? BorderSide(width: inverse(widget.side.down))
                : BorderSide.none,
            left: hasBorder(widget.side.left)
                ? BorderSide(width: inverse(widget.side.left))
                : BorderSide.none,
            right: hasBorder(widget.side.right)
                ? BorderSide(width: inverse(widget.side.right))
                : BorderSide.none,
            top: hasBorder(widget.side.up)
                ? BorderSide(width: inverse(widget.side.up))
                : BorderSide.none),
        color: Colors.green[100],
      ),
      child: Visibility(
        visible: occupied ?? widget.initOccupied,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

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
