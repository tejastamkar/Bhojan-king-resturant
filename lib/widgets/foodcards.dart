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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: 200,
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
                  const SizedBox(height: 7),
                  Container(
                    width: 100,
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 7),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("₹${widget.price}"),
                      const SizedBox(
                        width: 80,
                      ),
                      SizedBox(
                        width: 80,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: const Text('ADD'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
