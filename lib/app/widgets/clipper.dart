import 'package:flutter/material.dart';

class ClipperWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  } 

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
