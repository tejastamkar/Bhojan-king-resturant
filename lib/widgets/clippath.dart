import 'package:flutter/material.dart';

Widget pathWidget() => Builder(
      builder: (context) => ClipPath(
        clipper: CustomClipPath(),
        child:Container(
          color: Theme.of(context).primaryColor,
          height: 30,
        ),
      ),
    );

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();
    path.lineTo(0,height);

    // path.quadraticBezierTo(width * 0.4, height - 30,width, height, );
    path.quadraticBezierTo(width, height, width * 0.4, height - 30);
    // path.lineTo(width, height);
    path.lineTo( height,width);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
