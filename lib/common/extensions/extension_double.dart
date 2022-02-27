extension DoubleExt on double? {
  double orZero() {
    if (this == null) return 0.0;
    return this!;
  }
}
