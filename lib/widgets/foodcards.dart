import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restroapp/widgets/tags.dart';

class FoodCard extends StatefulWidget {
  final String name, image, decs, category;
  final int price, reviews;
  final double rate;
  final bool type, showdecs;
  const FoodCard(
      {Key? key,
      required this.name,
      required this.category,
      required this.image,
      required this.decs,
      required this.price,
      required this.rate,
      required this.type,
      required this.showdecs,
      required this.reviews})
      : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 131,
      width: width < 440 ? width : width / 2,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),

                  // width: 100,
                  // height: 120,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
                foodTag(type: widget.type)
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    widget.showdecs ? widget.decs : widget.category,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: widget.rate,
                      itemCount: 5,
                      itemSize: 15,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '(${widget.reviews})',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 1,
                    color: Colors.black,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("₹${widget.price}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.all(5)),
                    child: const Text('ADD'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
