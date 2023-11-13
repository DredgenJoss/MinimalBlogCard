import 'dart:math';
import 'package:flutter/material.dart';

class ScaleSize {
  BuildContext context;
  double maxTextScaleFactor;

  ScaleSize({
    required this.context,
    this.maxTextScaleFactor = 2,
  });

  double textScaleFactor({required double fontSize}) {
    // Ancho de la pantalla
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1500) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor)) * fontSize;
  }
}
