import 'package:flutter/material.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/screens/toppurchasescreen.dart';
import 'package:restroapp/widgets/foodcards.dart';

class TopPurchaseSec extends StatefulWidget {
  const TopPurchaseSec({Key? key}) : super(key: key);

  @override
  State<TopPurchaseSec> createState() => _TopPurchaseSecState();
}

class _TopPurchaseSecState extends State<TopPurchaseSec> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              const Text(
                'Top Purchase',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contect) => const TopPurchaseScreen()));
                },
                child: Text(
                  'View all',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(height: width / 3.211, child: topPurchaseItemList())
      ],
    );
  }
}

Widget topPurchaseItemList() => ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => FoodCard(
          showdecs: false,
          type: toppurchaseItems[index]['type'],
          name: toppurchaseItems[index]['name'],
          image: toppurchaseItems[index]['image'],
          decs: toppurchaseItems[index]['decs'],
          category: toppurchaseItems[index]['category'],
          price: toppurchaseItems[index]['price'],
          rate: toppurchaseItems[index]['rate'],
          reviews: toppurchaseItems[index]['review']),
    );
