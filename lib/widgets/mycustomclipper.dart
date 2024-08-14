import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path> {
  // @override
  // Path getClip(Size size) {
  //   Path path = Path();
  //   return path;
  // }

  @override
  Path getClip(Size size) {
    double radius = 40;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius))
      // ..lineTo(80, size.height)
      // ..arcToPoint(Offset(0, size.height - 40),
      //     radius: Radius.circular(radius), clockwise: false, largeArc: true)
      ..lineTo(size.width, size.height - 80)
      ..arcToPoint(
        Offset(size.width - 30, size.height - 60),
        radius: Radius.circular(50),
      )
      // ..lineTo(size.width, size.height - 80)
      ..arcToPoint(Offset(size.width - 60, size.height - 30),
          radius: Radius.circular(40), clockwise: false)
      ..arcToPoint(
        Offset(size.width - 80, size.height),
        radius: Radius.circular(50),
      )
      ..lineTo(radius, size.height)
      ..arcToPoint(
        Offset(0, size.height - 40),
        radius: Radius.circular(radius),
      )
      ..lineTo(0, radius)
      ..arcToPoint(Offset(radius, 0), radius: Radius.circular(radius))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
