enum RectangularMovement {
  up,
  right,
  down,
  left
}

extension RectangularMovementExt on RectangularMovement {
  RectangularMovement getOpposite() {
    if (this == RectangularMovement.up) {
      return RectangularMovement.down;
    }
    if (this == RectangularMovement.right) {
      return RectangularMovement.left;
    }
    if (this == RectangularMovement.down) {
      return RectangularMovement.up;
    }
    return RectangularMovement.right;
  }

  // TODO Implement fromInput(inputEvent)
}
