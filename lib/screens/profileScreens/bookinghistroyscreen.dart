import 'package:flutter/material.dart';
import 'package:restroapp/Data/itemlistdata.dart';
import 'package:restroapp/widgets/bookingcard.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Booking History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ListView.builder(
                itemCount: bookingList.length,
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
            ],
          ),
        ),
      ),
    );
  }
}
