import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restroapp/Data/restrodata.dart';

class BookingProcessScreen extends StatefulWidget {
  final String hotelName, address, fullAddress, name, date, time, email;
  final int count, mobile;
  final bool status;
  const BookingProcessScreen(
      {Key? key,
      required this.hotelName,
      required this.mobile,
      required this.address,
      required this.count,
      required this.date,
      required this.email,
      required this.fullAddress,
      required this.name,
      required this.status,
      required this.time})
      : super(key: key);

  @override
  State<BookingProcessScreen> createState() => _BookingProcessScreenState();
}

class _BookingProcessScreenState extends State<BookingProcessScreen> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Widget displayCard() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.hotelName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.address,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.fullAddress,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                  child: Icon(
                                Icons.check,
                                color: Theme.of(context).primaryColor,
                              )),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            width: 2,
                            height: 30,
                          ),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: widget.status
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                  child: widget.status
                                      ? Icon(
                                          Icons.check,
                                          color: Theme.of(context).primaryColor,
                                        )
                                      : const Text('')),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Booking Request Sent",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Processing Request",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "You'll get notification once request is Accepted",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: width < 441 ? width / 2 : width / 3,
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
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
                            child: SvgPicture.asset('icons/x.svg')),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Booking Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Time",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "People",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Email ID",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Mobile No",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: const [
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(1, 1, 1, 0.8)),
                        ),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(1, 1, 1, 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.date,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(1, 1, 1, 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.time,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(1, 1, 1, 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.count}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(1, 1, 1, 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.email,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(1, 1, 1, 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.mobile}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(1, 1, 1, 1)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
