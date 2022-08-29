import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restroapp/Data/cartdata.dart';

import 'package:restroapp/Data/itemlistdata.dart';
import 'package:restroapp/widgets/bookingcard.dart';
import 'package:restroapp/widgets/ordercard.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  String location = 'Home';
  @override
  Widget build(BuildContext context) {
    print(cartData);
    print(cartData.length);
    TabController tabController = TabController(length: 2, vsync: this);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            SvgPicture.asset('icons/map-pin.svg'),
            const SizedBox(
              width: 5,
            ),
            Text(location),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset('icons/chevron-down.svg')
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              child: TabBar(
                indicator: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4)),
                unselectedLabelColor: const Color.fromRGBO(110, 107, 107, 1),
                indicatorWeight: 0.1,
                // indicatorSize: ,
                labelColor: Colors.white,

                controller: tabController,
                isScrollable: false,
                // indicatorColor: Color.fromARGB(0, 0, 0, 0),
                tabs: const [
                  Tab(
                    child: Text(
                      'Order',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Booking',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: width,
            height: height - 230,
            child: TabBarView(
              physics: const ClampingScrollPhysics(),
              controller: tabController,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: OrderList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: ListView.builder(
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return BookingCardWidget(
                            name: bookingList[index]['name'],
                            address: bookingList[index]['address'],
                            date: bookingList[index]['date'],
                            time: bookingList[index]['time'],
                            status: bookingList[index]['status'],
                            count: bookingList[index]['count']);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
