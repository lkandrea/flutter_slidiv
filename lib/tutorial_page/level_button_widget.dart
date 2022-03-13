import 'package:flutter/material.dart';
import 'package:slidiv/common/style/slidiv_bold_text.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    Key? key,
    this.text,
    this.onTap,
    this.margin,
  }) : super(key: key);

  final String? text;
  final VoidCallback? onTap;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        margin: margin ?? const EdgeInsets.only(top: 16.0),
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
          text ?? "",
          style: const SlidivBoldText(fontSize: 24.0),
        ),
      ),
    );
  }
}
