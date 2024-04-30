import 'package:flutter/material.dart';

Widget buildCircularCard(Widget iconWidget, Color color, double iconSize) {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: SizedBox(
        width: iconSize,
        height: iconSize,
        child: iconWidget,
      ),
    ),
  );
}
