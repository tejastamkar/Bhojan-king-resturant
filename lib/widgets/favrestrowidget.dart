import 'package:flutter/material.dart';

class FavRestroWidget extends StatefulWidget {
  final String image, name;
  const FavRestroWidget({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<FavRestroWidget> createState() => _FavRestroWidgetState();
}

class _FavRestroWidgetState extends State<FavRestroWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
            child: Image.asset(
          widget.image,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        )),
        Text(
          widget.name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
