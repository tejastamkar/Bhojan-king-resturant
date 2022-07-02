// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:restroapp/screens/bookingprocess.dart';
import 'package:intl/intl.dart' show DateFormat;

class BookingScreen extends StatefulWidget {
  final String name, addresss, fullAddresss;

  const BookingScreen(
      {Key? key,
      required this.name,
      required this.addresss,
      required this.fullAddresss})
      : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String name = "Rohan Shah", email = "rohan1899@gmail.com";
  int mobile = 1234567890;

  DateTime selectedDate = DateTime.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  String selectDateString = "";
  int peopleCount = 1;
  TimeOfDay time = TimeOfDay.now().replacing(hour: 11, minute: 30);
  bool iosStyle = true;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      time = newTime;
    });
  }

  Dialog callPop = Dialog(
    child: SizedBox(
      height: 150,
      child: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "For larger Party, please contact the resturant",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Call',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancal',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022, 4),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

        selectDateString = formatter.format(picked);
      });
    }
  }

  @override
  void initState() {
    var temp = '$selectedDate'.split(' ');
    selectDateString = temp[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.addresss,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Center(
                child: Text(
                  widget.fullAddresss,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: (() => _selectDate(context)),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(
                                    color: Color.fromRGBO(1, 1, 1, 0.4))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    selectDateString,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      height: 15,
                                      width: 2,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Time",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: (() => Navigator.of(context).push(
                                showPicker(
                                  context: context,
                                  value: time,
                                  onChange: onTimeChanged,
                                  minuteInterval: MinuteInterval.FIVE,
                                  // Optional onChange to receive value as DateTime
                                  // onChangeDateTime: (DateTime dateTime) {},
                                ),
                              )),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(
                                    color: Color.fromRGBO(1, 1, 1, 0.4))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "${time.hour} : ${time.minute}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      height: 15,
                                      width: 2,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Count of Poeple',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: SizedBox(
                  width: 140,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                            color: Color.fromRGBO(1, 1, 1, 0.4))),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(
                            "$peopleCount",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              InkWell(
                                onTap: () => setState(() {
                                  if (peopleCount < 5) {
                                    peopleCount++;
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => callPop);
                                  }
                                }),
                                child: const RotatedBox(
                                    quarterTurns: 2,
                                    child: Icon(Icons.arrow_drop_down)),
                              ),
                              InkWell(
                                child: const Icon(Icons.arrow_drop_down),
                                onTap: () => setState(() {
                                  if (peopleCount > 0) {
                                    peopleCount--;
                                  }
                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      "Your Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
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
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(1, 1, 1, 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          email,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(1, 1, 1, 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$mobile',
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: InkWell(
          onTap: (() => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookingProcessScreen(
                      hotelName: widget.name,
                      address: widget.addresss,
                      count: peopleCount,
                      date: selectDateString,
                      email: email,
                      fullAddress: widget.fullAddresss,
                      name: name,
                      mobile: mobile,
                      status: false,
                      time: "${time.hour}:${time.minute}")))),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Theme.of(context).primaryColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Row(
                children: [
                  Text(
                    'Confirm Reservation',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
