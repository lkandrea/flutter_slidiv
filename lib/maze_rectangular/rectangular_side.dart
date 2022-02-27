import 'package:slidiv/common/enum/direction_enum.dart';

class RectangularSide {
  const RectangularSide({
    required this.up,
    required this.right,
    required this.down,
    required this.left,
  });

  final int up;

  final int right;

  final int down;

  final int left;

  List<Direction> getBlankSides() {
    List<Direction> blankSides = [];

    if (up == 1) {
      blankSides.add(Direction.up);
    }
    if (right == 1) {
      blankSides.add(Direction.right);
    }
    if (down == 1) {
      blankSides.add(Direction.down);
    }
    if (left == 1) {
      blankSides.add(Direction.left);
    }

    return blankSides;
  }
}
