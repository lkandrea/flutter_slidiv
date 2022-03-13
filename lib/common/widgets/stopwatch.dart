import 'dart:async';
import 'package:flutter/material.dart';
import 'package:slidiv/common/style/slidiv_bold_text.dart';

class StopwatchWidget extends StatefulWidget {
  const StopwatchWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  int elapsedTicks = 0;

  String formatTime(int n) => n.toString().padLeft(2, '0');

  String get elapsedHours => formatTime(elapsedTicks ~/ 3600);
  String get elapsedMinutes => formatTime((elapsedTicks ~/ 60) % 60);
  String get elapsedSeconds => formatTime(elapsedTicks % 60);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      startStopwatch();
    });
  }

  void startStopwatch() {
    Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() {
        elapsedTicks++;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Time elapsed: ",
          style: SlidivBoldText(fontSize: 16.0),
        ),
        Text(
          "$elapsedHours:$elapsedMinutes:$elapsedSeconds",
          style: const SlidivBoldText(fontSize: 16.0),
        ),
      ],
    );
  }
}

class _TimeContainer extends StatelessWidget {
  const _TimeContainer(this.time, {Key? key}) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Text(
        time,
        style: const SlidivBoldText(fontSize: 16.0),
      ),
    );
  }
}
