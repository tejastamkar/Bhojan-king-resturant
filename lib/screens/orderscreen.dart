import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restroapp/Data/userdata.dart';
import 'package:restroapp/widgets/bottomaddresspopup.dart';
import 'package:restroapp/widgets/orderfoodcard.dart';

enum AddressType { home, work, other }

class OrderScreen extends StatefulWidget {
  final String hotelName;
  const OrderScreen({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  num subtotal = getSubtotal();
  num tax = 70, deliveryFee = 40;
  bool show = false;
  AddressType selectedAddress = AddressType.home;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Future adddressPop(
      BuildContext context,
    ) {
      return showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))),
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return const AddressPop();
          });
    }

    Widget address() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      adddressPop(context);
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: const Border(
                        left: BorderSide(style: BorderStyle.solid),
                        right: BorderSide(style: BorderStyle.solid),
                        top: BorderSide(style: BorderStyle.solid),
                        bottom: BorderSide(style: BorderStyle.solid),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery to ${userAddress[0]['which']}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text('${userAddress[0]['address']}')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );

    Widget bill() => Column(
          children: [
            Container(
              width: width,
              height: 1,
              color: Colors.grey.shade200,
            ),
            Row(
              children: [
                const Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Text('₹$subtotal')
              ],
            ),
            Row(
              children: [
                const Text(
                  'Delivery fee',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Text('₹$deliveryFee',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              children: [
                const Text(
                  'Taxes',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Text('₹$tax',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400))
              ],
            ),
            Container(
              width: width,
              height: 1,
              color: Colors.grey.shade200,
            ),
            Row(
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text('₹${tax + deliveryFee + subtotal}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        );
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Proceed to Payment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Order from ${widget.hotelName}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: userOrder.length,
              itemBuilder: (context, index) => userOrder[index]['count'] == 0
                  ? const Text('')
                  : Column(
                      children: [
                        OrderFoodCard(
                          count: userOrder[index]['count'],
                          image: userOrder[index]['image'],
                          itemName: userOrder[index]['itemName'],
                          vn: userOrder[index]['type'] == 'V' ? true : false,
                          price: userOrder[index]['price'],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          height: 1,
                          color: Colors.grey.shade200,
                        ),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset('icons/tag.svg'),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('Apply Coupons'),
                      const Spacer(),
                      const RotatedBox(
                        quarterTurns: 2,
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bill(),
            address(),
          ],
        ),
      )),
    );
  }
}

num getSubtotal() {
  num subtotal = 0;
  for (int i = 0; i < userOrder.length; i++) {
    subtotal += userOrder[i]['price'] * userOrder[i]['count'];
  }

  return subtotal;
}
