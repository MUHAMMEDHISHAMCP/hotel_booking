import 'package:flutter/material.dart';

class ShowDialogs {
  static SnackBar popUp(String messege, [Color color = Colors.red]) {
    return SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        margin: const EdgeInsets.all(10),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            messege,
            style: const TextStyle(
                letterSpacing: 2, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ));
  }
}
