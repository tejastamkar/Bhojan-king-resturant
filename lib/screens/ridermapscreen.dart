import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restroapp/Data/itemlistdata.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RiderMapScreen extends StatefulWidget {
  final String deliveryPlace,
      deliveryAddress,
      restroPlace,
      restroAdress,
      riderImage,
      riderName;
  final int review;
  final int time, index;
  const RiderMapScreen(
      {Key? key,
      required this.index,
      required this.review,
      required this.riderName,
      required this.riderImage,
      required this.time,
      required this.restroAdress,
      required this.restroPlace,
      required this.deliveryAddress,
      required this.deliveryPlace})
      : super(key: key);

  @override
  State<RiderMapScreen> createState() => _RiderMapScreenState();
}

class _RiderMapScreenState extends State<RiderMapScreen> {
  bool Open = false;
  @override
  Widget build(BuildContext context) {
    final List orderdetails = doneOrderList[widget.index]['order'];
    final List restroAddrees = doneOrderList[widget.index]['restro_address'];
    final List deliveryAddress =
        doneOrderList[widget.index]['delivery_address'];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.riderImage,
                  width: Open ? 60 : 35,
                  height: Open ? 60 : 35,
                  fit: BoxFit.fill),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 200,
              height: Open ? 60 : 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.riderName} is on his way to the Resturant to pick up your order',
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                  Open
                      ? Container(
                          width: 40,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                const Spacer(),
                                Text(
                                  '${widget.review}.0',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
            const Spacer(),
            SvgPicture.asset('icons/PhoneIcon.svg'),
          ],
        ),
      ),
      body: Stack(
        children: [
          const Center(
            child: Text('Map View'),
          ),
          SlidingUpPanel(
            onPanelOpened: () {
              setState(() {
                Open = true;
              });
            },
            onPanelClosed: () {
              setState(() {
                Open = false;
              });
            },
            minHeight: height / 3,
            maxHeight: height - 100,
            panel: Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        width: 50,
                        height: 4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            'Delivery in ${widget.time} mins',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: RatingBarIndicator(
                        rating: 3.5,
                        itemCount: 6,
                        itemSize: width / 7,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).primaryColor,
                            ),
                            width: 120,
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.home_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.deliveryPlace,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              widget.deliveryAddress,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: SizedBox(
                        height: 50,
                        child: DottedLine(
                          dashLength: 2.5,
                          direction: Axis.vertical,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.restroPlace,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              widget.restroAdress,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'ORDER #${doneOrderList[widget.index]['Order_No']}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${doneOrderList[widget.index]['order'].length} Items | ₹${doneOrderList[widget.index]['total_amount']}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(0, 0, 0, 0.58)),
                                  ),
                                ],
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    doneOrderList[widget.index]['order'].length,
                                itemBuilder: (context, index) => Row(
                                  children: [
                                    Text(
                                      '${orderdetails[index]['item_name']} x ${orderdetails[index]['number_of_item']}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.58)),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '₹${orderdetails[index]['amount']}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.58)),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Text('Delivery Charges',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.58))),
                                  const Spacer(),
                                  Text('₹${doneOrderList[widget.index]['dc']}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.58)))
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Taxes',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(0, 0, 0, 0.58))),
                                  const Spacer(),
                                  Text('₹${doneOrderList[widget.index]['tax']}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.58)))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 10),
                                child: Container(
                                  color: Colors.grey,
                                  height: 1,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text('Total Bill',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(0, 0, 0, 1))),
                                  const Spacer(),
                                  Text(
                                      '₹${doneOrderList[widget.index]['total_amount']}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(0, 0, 0, 1)))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Help?',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
