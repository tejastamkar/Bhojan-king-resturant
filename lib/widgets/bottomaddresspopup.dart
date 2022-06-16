import 'package:flutter/material.dart';
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
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Column(
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
          Card(
            child: Column(
              children: [
                const Text(
                  'Flat no/Room no',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(30, 26, 26, 0.6)),
                ),
                TextFormField(initialValue: ''),
              ],
            ),
          )
        ],
      ),
    );
  }
}
