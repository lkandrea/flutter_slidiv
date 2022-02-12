import 'package:flutter_application_1/models/movements/rectangular_movement.dart';
import 'package:flutter_application_1/models/sides/sides.dart';

class RectangularTile {
  const RectangularTile({required this.side, required this.occupied});
  
  final RectangularSide side;

  final bool occupied;

  List<RectangularMovement> getPossibleMoves(RectangularMovement? lastValidMovement) {
    if (occupied && lastValidMovement != null) {
      List<RectangularMovement> blankSides = side.getBlankSides();
      blankSides.remove(lastValidMovement.getOpposite());
      return blankSides;
    }
    return [];
  }

  RectangularTile occupy() {
    return RectangularTile(side: side, occupied: true);
  }

  RectangularTile leave() {
    return RectangularTile(side: side, occupied: false);
  }
}
