import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restroapp/Data/userdata.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({Key? key}) : super(key: key);

  @override
  State<SavedAddressScreen> createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
  final toast = FToast();
  @override
  void initState() {
    toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget sucessfullyPopup() => Dialog(
          backgroundColor: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Address Added Successfully',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ],
            ),
          ),
        );
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.white, primary: Theme.of(context).primaryColor),
        onPressed: () => toast.showToast(
            child: sucessfullyPopup(), gravity: ToastGravity.BOTTOM),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add),
              SizedBox(
                width: 10,
              ),
              Text(
                'Add Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Saved Address',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        child: ListView.builder(
          itemCount: userAddress.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: addressCard(
                name: userAddress[index]['which'],
                address: userAddress[index]['address'],
                icon: userAddress[index]['which'] == 'work' ||
                        userAddress[index]['which'] == 'Work'
                    ? 'icons/Building.svg'
                    : 'icons/home.svg'),
          ),
        ),
      ),
    );
  }
}

Widget addressCard(
        {required String name,
        required String address,
        required String icon}) =>
    Builder(
      builder: (context) => Stack(
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      address,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
          Builder(builder: (context) {
            return Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  color: Colors.white,
                ),
              ),
            );
          }),
        ],
      ),
    );
