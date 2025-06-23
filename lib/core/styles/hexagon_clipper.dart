import 'dart:math';

import 'package:flutter/material.dart';

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double w = size.width;
    final double h = size.height;
    final double r = w / 2;
    final double centerX = w / 2;
    final double centerY = h / 2.5; // كان h / 2 وده اللي بيخلي الصورة تطلع فوق

    for (int i = 0; i < 6; i++) {
      final angle = pi / 3 * i - pi / 2;
      final x = centerX + r * cos(angle);
      final y = centerY + r * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
