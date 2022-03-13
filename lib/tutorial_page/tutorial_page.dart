import 'package:flutter/material.dart';
import 'package:slidiv/common/constant/hero_constants.dart';
import 'package:slidiv/common/navigation/navigation_util.dart';
import 'package:slidiv/common/style/slidiv_bold_text.dart';
import 'package:slidiv/common/style/slidiv_normal_text.dart';
import 'package:slidiv/common/widgets/button.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 32.0,
          right: 32.0,
          bottom: 128.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: HeroConstants.slidivTitle,
              child: Text(
                "Slidiv Tutorial",
                style: SlidivBoldText(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                "A simple maze, but you can't turn your back!",
                style: SlidivNormalText(),
              ),
            ),
            GestureDetector(
              onTap: () => NavigationUtil().navigateToLevelTwo(context),
              child: const Button(
                "Start",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
