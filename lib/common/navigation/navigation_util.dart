import 'package:flutter/material.dart';

class NavigationUtil {
  static void push(BuildContext context, Widget destination) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return destination;
    }));
  }
}
