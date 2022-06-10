import 'package:flutter/material.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({Key? key}) : super(key: key);

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved Address',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // Stack(
          //   alignment: Alignment.centerRight,
          //   children: [],
          // )
        ],
      ),
    );
  }
}
