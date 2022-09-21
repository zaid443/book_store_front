import 'package:flutter/material.dart';

/// Clip widget in oval shape at top side
class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 1.5);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height / 1.5);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
