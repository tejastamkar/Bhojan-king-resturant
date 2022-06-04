import 'package:flutter/material.dart';

class BookingCardWidget extends StatefulWidget {
  final String name, address, date, time, status;
  final int count;

  const BookingCardWidget(
      {Key? key,
      required this.name,
      required this.address,
      required this.date,
      required this.time,
      required this.status,
      required this.count})
      : super(key: key);

  @override
  State<BookingCardWidget> createState() => _BookingCardWidgetState();
}

class _BookingCardWidgetState extends State<BookingCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('assets/coffee.png', fit: BoxFit.fill)),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(widget.address,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 0, 0, 0.58))),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('View more',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: <Widget>[
                  const Text(
                    'Date : ',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  Text(widget.date,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  const Text('Time : ',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                  Text(widget.time,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  const Text('Count of People : ',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                  Text('${widget.count}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Row(
              children: <Widget>[
                const Text('Status : ',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                Text(widget.status,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
