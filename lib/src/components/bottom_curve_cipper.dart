import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  // @override
  // Path getClip(Size size) {
  //   Path path = Path();
  //   path.lineTo(0, size.height);
  //   path.quadraticBezierTo(
  //       size.width / 2, size.height - 80, size.width, size.height);
  //   path.lineTo(size.width, 0);

  //   return path;
  // }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}