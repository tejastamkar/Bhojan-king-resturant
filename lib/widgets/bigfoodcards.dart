import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BigFoodCard extends StatefulWidget {
  final String name, item, image;
  final double rate;
  final int time;
  const BigFoodCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.item,
      required this.time,
      required this.rate})
      : super(key: key);

  @override
  State<BigFoodCard> createState() => _BigFoodCardState();
}

class _BigFoodCardState extends State<BigFoodCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.image,
                  width: 160,
                  height: 100,
                  fit: BoxFit.cover,
                ),
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
              widget.item,
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
                const Spacer(),
                SvgPicture.asset(
                  'icons/clock.svg',
                  height: 18,
                ),
                Text(
                  '${widget.time} mins',
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.58),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
