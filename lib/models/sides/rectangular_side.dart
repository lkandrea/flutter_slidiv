import 'package:flutter_application_1/models/movements/rectangular_movement.dart';
import 'package:flutter_application_1/models/sides/side.dart';

class RectangularSide implements Side<RectangularMovement> {
  const RectangularSide({required this.up, required this.right, required this.down, required this.left});
  
  final int up;

  final int right;

  final int down;

  final int left;

  @override
  List<RectangularMovement> getBlankSides() {
    List<RectangularMovement> blankSides = [];

    if (up == 0) {
      blankSides.add(RectangularMovement.up);
    }
    if (right == 0) {
      blankSides.add(RectangularMovement.right);
    }
    if (down == 0) {
      blankSides.add(RectangularMovement.down);
    }
    if (left == 0) {
      blankSides.add(RectangularMovement.left);
    }

    return blankSides;
  }
}
