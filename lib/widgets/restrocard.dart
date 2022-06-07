import 'package:flutter/material.dart';

class RestroCardWidget extends StatefulWidget {
  final String name, place, image;
  final double rate;
  const RestroCardWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.place,
      required this.rate})
      : super(key: key);

  @override
  State<RestroCardWidget> createState() => _RestroCardWidgetState();
}

class _RestroCardWidgetState extends State<RestroCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.image,
                width: 160,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.name,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              widget.place,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 0.58)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  color: const Color.fromRGBO(80, 165, 114, 1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 13,
                          color: Colors.white,
                        ),
                        // Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 5),
                          child: Text("${widget.rate}",
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
