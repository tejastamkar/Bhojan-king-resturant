import 'package:flutter/material.dart';
import 'package:restroapp/Data/itemlistdata.dart';
import 'package:restroapp/widgets/ordercard.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Order History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
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
      ),
    );
  }
}
