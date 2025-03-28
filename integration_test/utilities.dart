import 'package:flutter/material.dart';

class TestUtilities {
  static Brightness computeBrightness(Color color) {
    if (color.computeLuminance() > 0.5) {
      return Brightness.light;
    }
    return Brightness.dark;
  }
}
