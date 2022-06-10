import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restroapp/Data/notificationData.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget notificationCard(
            {required String text, required bool status, required int index}) =>
        InkWell(
          onTap: () {
            notificationList[index]['status'] =
                !notificationList[index]['status'];
          },
          child: Card(
            color:
                status ? Colors.white : const Color.fromRGBO(255, 240, 227, 1),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  SvgPicture.asset(
                    'icons/bell.svg',
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Center(
                    child: SizedBox(
                      width: width / 2,
                      child: Text(
                        text,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: notificationCard(
                            index: index,
                            text: notificationList[index]['text'],
                            status: notificationList[index]['status']),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
