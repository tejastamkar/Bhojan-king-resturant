import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restroapp/Data/itemlistdata.dart';
import 'package:restroapp/screens/ordersummary.dart';

class OrderList extends StatefulWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          ListView.builder(
              itemCount: doneOrderList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return PendingOrder(
                  riderImage: orderList[index]['rider_image'],
                  riderName: orderList[index]['rider_name'],
                  time: orderList[index]['time'],
                  date: orderList[index]['date'],
                  orderNo: orderList[index]['Order_No'],
                  riderNumber: orderList[index]['rider_number'],
                  price: orderList[index]['price'],
                  itemNo: orderList[index]['item_no'],
                );
              }),
          ListView.builder(
              itemCount: doneOrderList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CompletedOrder(
                    index: index,
                    image: doneOrderList[index]['image'],
                    name: doneOrderList[index]['name'],
                    time: doneOrderList[index]['time'],
                    date: doneOrderList[index]['date'],
                    orderNo: doneOrderList[index]['Order_No'],
                    order: doneOrderList[index]['order'],
                    address: doneOrderList[index]['address'],
                    amount: doneOrderList[index]['total_amount'],
                    rate: doneOrderList[index]['rate']);
              }),
        ],
      ),
    );
  }
}

class PendingOrder extends StatefulWidget {
  final String time, riderName, riderImage, date;
  final int itemNo, price, riderNumber, orderNo;
  const PendingOrder({
    Key? key,
    required this.time,
    required this.riderImage,
    required this.riderName,
    required this.riderNumber,
    required this.date,
    required this.itemNo,
    required this.orderNo,
    required this.price,
  }) : super(key: key);

  @override
  State<PendingOrder> createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order #${widget.orderNo}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    Text(
                        '${widget.time} | ${widget.itemNo} Items, ₹${widget.price}',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.58))),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View more',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
          Image.asset('assets/maps.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Order Confirmed',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    SizedBox(
                      width: 200,
                      child: Text(
                        '${widget.riderName} is on his way to the Resturant to pick up your order',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(widget.riderImage,
                      width: 35, height: 35, fit: BoxFit.fill),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 2,
                  height: 30,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset('icons/Telephone.svg')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedOrder extends StatefulWidget {
  final String image, name, address, amount, time, date;
  final int rate, orderNo, index;
  final List order;

  const CompletedOrder(
      {Key? key,
      required this.index,
      required this.image,
      required this.name,
      required this.time,
      required this.orderNo,
      required this.date,
      required this.order,
      required this.address,
      required this.amount,
      required this.rate})
      : super(key: key);

  @override
  State<CompletedOrder> createState() => _CompletedOrderState();
}

class _CompletedOrderState extends State<CompletedOrder> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    OrderSummaryScreen(index: widget.index))));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          widget.image,
                          width: 70,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
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
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.address,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 250,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.order.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Container(
                            width: 2,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${widget.order[index]['item_name']} x ${widget.order[index]['number_of_item']}",
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Total Paid : ₹${widget.amount}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ]),
                const Spacer(),
                Column(
                  children: [
                    SvgPicture.asset('icons/orderDone.svg'),
                    Text(
                      'Order #${widget.orderNo}',
                      style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(1, 1, 1, 0.6)),
                    ),
                    Text(
                      '${widget.date} , ${widget.time}',
                      style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(1, 1, 1, 0.6)),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 1,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    side: BorderSide(
                      width: 1.0,
                      color: Theme.of(context).primaryColor,
                      style: BorderStyle.solid,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Reorder',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.white),
                    child: const Text('Help',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400))),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20,
                            color: Color.fromRGBO(242, 246, 40, 1),
                          ),
                          Text(
                            '${widget.rate}/5',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const Text(
                        'Review',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
