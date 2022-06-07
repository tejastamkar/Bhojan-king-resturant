import 'package:flutter/material.dart';

class BrandWidget extends StatefulWidget {
  final String image, name;
  const BrandWidget({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<BrandWidget> createState() => _BrandWidgetState();
}

class _BrandWidgetState extends State<BrandWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(widget.image),
        Text(
          widget.name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
