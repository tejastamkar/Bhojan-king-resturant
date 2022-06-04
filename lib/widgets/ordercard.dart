import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderCardWidget extends StatefulWidget {
  final String time, riderName, riderImage, status, date;
  final int itemNo, price, riderNumber, orderNo;
  const OrderCardWidget(
      {Key? key,
      required this.status,
      required this.date,
      required this.orderNo,
      required this.time,
      required this.itemNo,
      required this.price,
      required this.riderImage,
      required this.riderName,
      required this.riderNumber})
      : super(key: key);

  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.status == 'Done') {
      return Card(
        child: Row(
          children: [
            Column(children: []),
            Spacer(),
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
                )
              ],
            )
          ],
        ),
      );
    }

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
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(widget.riderImage,
                      width: 35, height: 35, fit: BoxFit.fill),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 2,
                  height: 30,
                  color: Colors.grey,
                ),
                SizedBox(
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
