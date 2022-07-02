import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restroapp/Data/restrodata.dart';
import 'package:restroapp/screens/bookingscreen.dart';
import 'package:restroapp/screens/restroscreen.dart';

class HotelDetialsScreen extends StatefulWidget {
  final String name, place, bestFor;
  final double rate, review, time;

  const HotelDetialsScreen(
      {Key? key,
      required this.bestFor,
      required this.time,
      required this.name,
      required this.place,
      required this.rate,
      required this.review})
      : super(key: key);

  @override
  State<HotelDetialsScreen> createState() => _HotelDetialsScreenState();
}

class _HotelDetialsScreenState extends State<HotelDetialsScreen> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Widget reviewCard(
            {required String image,
            required String name,
            required String date,
            required String review,
            required double rate}) =>
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 2,
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                  )
                ],
                borderRadius: BorderRadius.circular(12)),
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: ClipOval(
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                RatingBarIndicator(
                                  rating: rate,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width < 440 ? width / 2.6 : width / 1.5,
                            ),
                            Text(
                              date,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            review,
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                        )
                      ])
                ],
              ),
            ));

    Widget displayCard() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            widget.place,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(0, 0, 0, 0.58)),
                          ),
                          Container(
                            height: 1,
                            width: 200,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.favorite_border_rounded)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 25,
                        color: Colors.yellow.shade500,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.rate} rating    ${widget.review}+',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.58)),
                          ),
                          Text(
                            '${widget.time} mins (Delivery time)',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.58)),
                          ),
                          Text(
                            '₹${widget.bestFor}',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.58)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingScreen(
                                    name: widget.name,
                                    addresss: widget.place,
                                    fullAddresss:
                                        'Gound Floor, hotel parkway ,Sea face off , Old Cadel Rd. near Shivaji park, Dadar West , Mumbai, Maharashtra 400028',
                                  ))),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: width < 440 ? 15 : 25),
                          child: Row(
                            children: [
                              Text(
                                'Book a table',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestroScreen(
                                    name: widget.name,
                                    rating: widget.rate,
                                    time: widget.time.toInt(),
                                    address: 'Oberior mall ,Goregoan(E)',
                                    offer:
                                        'OFFER 10% OFF on all non-veg burger',
                                    bestFor: '500 for two',
                                    review: 200,
                                  )))),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: width < 440 ? 15 : 25),
                          child: Row(
                            children: [
                              Text(
                                'Place Order',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: width < 440 ? 15 : 25),
                          child: Row(
                            children: [
                              Text(
                                'Write Review',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: width < 440 ? width / 2 : width / 3,
                        aspectRatio: 1 / 1,
                        viewportFraction: 1,
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            current = index;
                          });
                        }),
                    items: restroCardList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            i['image'],
                            scale: 1 / 1,
                            fit: BoxFit.cover,
                            width: width,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(8, 5, 0, 5),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: CarouselIndicator(
                  height: 10,
                  width: 10,
                  // animationDuration: 100,
                  cornerRadius: 10,
                  color: const Color.fromARGB(250, 255, 255, 255),
                  activeColor: Theme.of(context).primaryColor,
                  count: restroCardList.length,
                  index: current,
                ),
              ),
              displayCard(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ExpandablePanel(
                    header: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Review'),
                    ),
                    collapsed: const Text(''),
                    expanded: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: restroReview.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: reviewCard(
                                  image: restroReview[index]['image'],
                                  name: restroReview[index]['name'],
                                  date: restroReview[index]['date'],
                                  review: restroReview[index]['review'],
                                  rate: restroReview[index]['rate'].toDouble()),
                            )))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
