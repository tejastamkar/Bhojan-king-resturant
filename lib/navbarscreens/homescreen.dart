import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: Image.asset('icons/main_logo.png'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              'icons/bell.svg',
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Text(
                      'Resturant Temporarily Closed',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Switch(
                      onChanged: (bool isSwitched) {
                        setState(() {
                          this.isSwitched = isSwitched;
                        });
                      },
                      value: isSwitched,
                      activeColor: Colors.green.shade300,
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.grey.shade100,
                      inactiveTrackColor: Colors.grey.shade600,
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
