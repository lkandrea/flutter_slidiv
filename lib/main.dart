import 'package:flutter/material.dart';
import 'package:slidiv/tutorial_page/tutorial_page.dart';

void main() {
  runApp(const SlidivApp());
}

class SlidivApp extends StatelessWidget {
  const SlidivApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidiv',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SafeArea(child: TutorialPage()),
    );
  }
}
