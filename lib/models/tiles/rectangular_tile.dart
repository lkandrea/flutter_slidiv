import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/enum/screen_size_enum.dart';
import 'package:flutter_application_1/common/widgets/responsive_container_widget.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/models/sides/sides.dart';

class RectangularTile extends StatelessWidget {
  const RectangularTile({
    required this.side,
    required this.occupied,
    required this.tileColor,
    required this.movement,
    Key? key,
  }) : super(key: key);

  final RectangularSide side;
  final bool occupied;
  final Color tileColor;
  final RectangularMovement? movement;

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

        return Container(
          width: _tileSize,
          height: _tileSize,
          decoration: BoxDecoration(
            color: tileColor,
            border: Border(
              bottom: _createBorder(side.down),
              left: _createBorder(side.left),
              right: _createBorder(side.right),
              top: _createBorder(side.up),
            ),
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
