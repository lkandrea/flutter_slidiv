import 'package:flutter/material.dart';
import 'package:slidiv/common/style/slidiv_bold_text.dart';

class GreenButton extends StatelessWidget {
  const GreenButton(
    this.text, {
    this.fontSize,
    Key? key, 
  }) : super(key: key);

  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        boxShadow: const [
          BoxShadow(
            blurStyle: BlurStyle.inner,
            blurRadius: 4.0,
            spreadRadius: 0.5,
            offset: Offset(0.0, 2.0),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Text(
        text,
        style: SlidivBoldText(fontSize: fontSize ?? 24.0),
      ),
    );
  }
}
