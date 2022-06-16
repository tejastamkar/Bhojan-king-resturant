import 'package:flutter/material.dart';
import 'package:restroapp/Data/userdata.dart';
import 'package:restroapp/screens/orderscreen.dart';

class AddressPop extends StatefulWidget {
  const AddressPop({
    Key? key,
  }) : super(key: key);

  @override
  State<AddressPop> createState() => _AddressPopState();
}

class _AddressPopState extends State<AddressPop> {
  AddressType selectedAddress = AddressType.home;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          height: height - 150,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delivery Address',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Container(
                  width: width,
                  height: 1,
                  color: Colors.grey.shade200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<AddressType>(
                      activeColor: Theme.of(context).primaryColor,
                      groupValue: selectedAddress,
                      value: AddressType.home,
                      onChanged: (AddressType? value) {
                        setState(
                          () {
                            selectedAddress = value!;
                          },
                        );
                      },
                    ),
                    const Text('Home'),
                    Radio<AddressType>(
                      activeColor: Theme.of(context).primaryColor,
                      groupValue: selectedAddress,
                      value: AddressType.work,
                      onChanged: (AddressType? value) {
                        setState(
                          () {
                            selectedAddress = value!;
                          },
                        );
                      },
                    ),
                    const Text('Work'),
                    Radio<AddressType>(
                      activeColor: Theme.of(context).primaryColor,
                      groupValue: selectedAddress,
                      value: AddressType.other,
                      onChanged: (AddressType? value) {
                        setState(
                          () {
                            selectedAddress = value!;
                          },
                        );
                      },
                    ),
                    const Text('Other'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.grey.shade300)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Flat no/Room no',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(30, 26, 26, 0.6)),
                          ),
                          TextFormField(
                            initialValue: userAddress[0]["address"]["flatNo"],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.grey.shade300)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Residency Name/Street Name',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(30, 26, 26, 0.6)),
                          ),
                          TextFormField(
                            initialValue: userAddress[0]["address"]
                                ["ResidencyName"],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.grey.shade300)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'City/Town',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(30, 26, 26, 0.6)),
                          ),
                          TextFormField(
                            initialValue: userAddress[0]["address"]["City"],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.grey.shade300)),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pin code',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(30, 26, 26, 0.6)),
                          ),
                          TextFormField(
                            initialValue: userAddress[0]["address"]["pin"],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          onPrimary: const Color.fromRGBO(100, 100, 100, 1),
                          primary: const Color.fromRGBO(238, 238, 238, 1)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          onPrimary: Colors.white,
                          primary: Theme.of(context).primaryColor),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
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
  }
}
