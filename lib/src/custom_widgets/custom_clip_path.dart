
import 'package:flutter/cupertino.dart';

class CurvedButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start at the bottom-left corner
    var firstStart = Offset(size.width /5, size.height);
    var firstEnd = Offset(size.width /2.25, size.height - 50.0);

    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width , size.height);

    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}


class CurvedButtonClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height); // Start at the bottom-left corner
    var firstStart = Offset(size.width /10, size.height);
    var firstEnd = Offset(size.width /3, size.height - 50.0);

    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width , size.height);

    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);

    var thirdStart = Offset(size.width - 5, size.height - 105);
    var thirdEnd = Offset(size.width , size.height - 105);

    path.quadraticBezierTo(thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);
    path.lineTo(size.width, 0);
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

