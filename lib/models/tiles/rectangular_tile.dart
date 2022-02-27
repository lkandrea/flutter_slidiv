import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/models/sides/sides.dart';

class RectangularTile extends StatelessWidget {
  const RectangularTile(this.side, this.occupied, this.movement, {Key? key})
      : super(key: key);

  final _tileWidth = 50.0;
  final _tileHeight = 50.0;

  final RectangularSide side;
  final bool occupied;
  final RectangularMovement? movement;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _tileWidth,
      height: _tileHeight,
      decoration: BoxDecoration(
        border: Border(
          bottom: _createBorder(side.down),
          left: _createBorder(side.left),
          right: _createBorder(side.right),
          top: _createBorder(side.up),
        ),
        color: Colors.green[100],
      ),
      child: occupied ? Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ) : 
        // TODO Fix trail render
        Visibility(
          visible: movement != null,
          child: (movement == RectangularMovement.up || movement == RectangularMovement.down) ? 
          const VerticalDivider(color: Colors.red) : const Divider(color: Colors.red),
        ),
    );
  }

  BorderSide _createBorder(int borderSide) {
    return borderSide != 1
        ? BorderSide(width: inverse(borderSide))
        : BorderSide.none;
  }

  double inverse(int num) {
    if (num == 1) {
      return 0;
    }
    return 1;
  }
}
