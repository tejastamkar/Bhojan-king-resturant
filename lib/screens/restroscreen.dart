import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/widgets/foodcards.dart';

class RestroScreen extends StatefulWidget {
  final String name, address, bestFor, offer;
  final int time, review;
  final double rating;
  const RestroScreen(
      {Key? key,
      required this.name,
      required this.address,
      required this.bestFor,
      required this.offer,
      required this.time,
      required this.rating,
      required this.review})
      : super(key: key);

  @override
  State<RestroScreen> createState() => _RestroScreenState();
}

class _RestroScreenState extends State<RestroScreen> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Dialog menuDialogBox = Dialog(
      backgroundColor: Colors.white,
      child: ListView.builder(
          itemCount: foodmenuList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // crossAxisAlignment:,
                  children: [
                    Text(foodmenuList[index]['name']),
                    const Spacer(),
                    Text('(${foodmenuList[index]['items']})')
                  ],
                ),
              )),
    );

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
                            widget.address,
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
                            '${widget.rating} rating    ${widget.review}+',
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
                          DottedBorder(
                            color: Theme.of(context).primaryColor,
                            strokeWidth: 1,
                            dashPattern: const [10, 6],
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                color: const Color.fromRGBO(254, 232, 234, 1),
                                child: Text(
                                  widget.offer,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                        ],
                      )
                    ],
                  )
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
                    items: restroPageBg.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            i,
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
                  count: restroPageBg.length,
                  index: current,
                ),
              ),
              displayCard(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          color: Colors.grey.shade200,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Veg'),
                        const SizedBox(
                          width: 40,
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          color: Colors.grey.shade200,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Veg'),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor)),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => menuDialogBox);
                            },
                            child: const Text('Browers menu')),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: ListView.builder(
                  itemCount: foodmenuList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ExpandablePanel(
                      header: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            '${foodmenuList[index]['name']}(${foodmenuList[index]['items']})'),
                      ),
                      expanded: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) => FoodCard(
                            showdecs: true,
                            type: toppurchaseItems[index]['type'],
                            name: toppurchaseItems[index]['name'],
                            image: toppurchaseItems[index]['image'],
                            decs: toppurchaseItems[index]['decs'],
                            category: toppurchaseItems[index]['category'],
                            price: toppurchaseItems[index]['price'],
                            rate: toppurchaseItems[index]['rate'],
                            reviews: toppurchaseItems[index]['review']),
                      ),
                      collapsed: const Text(''),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
