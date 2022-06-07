import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restroapp/Data/itemlistdata.dart';

class OrderSummaryScreen extends StatefulWidget {
  final int index;
  // final List data;
  const OrderSummaryScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    final List orderdetails = doneOrderList[widget.index]['order'];
    final List restroAddrees = doneOrderList[widget.index]['restro_address'];
    final List deliveryAddress =
        doneOrderList[widget.index]['delivery_address'];
    Widget bill() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                            fontSize: 16, fontWeight: FontWeight.w500),
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
                    itemCount: doneOrderList[widget.index]['order'].length,
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
                              color: Color.fromRGBO(0, 0, 0, 0.58))),
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
                              color: Color.fromRGBO(0, 0, 0, 0.58))),
                      const Spacer(),
                      Text('₹${doneOrderList[widget.index]['tax']}',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.58)))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
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
                      Text('₹${doneOrderList[widget.index]['total_amount']}',
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
        );

    Widget addressTrack() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restroAddrees[0]['name'],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 90,
                        child: Text(
                          restroAddrees[0]['address'],
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 10,
                      ),
                      Text(
                        deliveryAddress[0]['name'],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 90,
                        child: Text(
                          deliveryAddress[0]['address'],
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('From',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(107, 107, 107, 1))),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 5,
                        child: const DottedLine(
                          dashLength: 2.5,
                          direction: Axis.vertical,
                        ),
                      ),
                      const Text('To'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 5),
            primary: Theme.of(context).primaryColor,
            side: BorderSide(
              width: 1.0,
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid,
            ),
          ),
          child: const Text(
            'Reorder',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'Order Summary',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      const Text(
                        'Order Succefully Delivery',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      SvgPicture.asset('icons/greenTick.svg')
                    ],
                  ),
                ),
              ),
            ),
            bill(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    children: [
                      const Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        doneOrderList[widget.index]['delivery_type'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        doneOrderList[widget.index]['date'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    children: [
                      const Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        doneOrderList[widget.index]['time'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            addressTrack(),
          ],
        ),
      ),
    );
  }
}
