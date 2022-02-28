import 'package:flutter/cupertino.dart';

class SlidivBoldText extends TextStyle {
  const SlidivBoldText({double? fontSize})
      : super(
          inherit: false,
          fontSize: fontSize ?? 32.0,
          fontWeight: FontWeight.bold
        );
}
