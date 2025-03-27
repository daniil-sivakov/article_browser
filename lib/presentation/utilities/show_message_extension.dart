import 'package:flutter/material.dart';

extension ShowMessageExtension on BuildContext {
  void showMessage(String message) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(
      this,
    ).showSnackBar(SnackBar(content: Center(child: Text(message))));
  }
}
