import 'package:flutter/material.dart';

class SlidivNormalText extends TextStyle {
  const SlidivNormalText({double? fontSize})
      : super(
          inherit: false,
          fontSize: fontSize ?? 16.0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        );
}
