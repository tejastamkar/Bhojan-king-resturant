import 'package:flutter/material.dart';
import 'package:restroapp/widgets/foodcards.dart';

List toppurchaseItems = [
  {
    'name': 'Maharaja Mac',
    'image': 'assets/burgerImage.png',
    'decs':
        '2 Crispy Veg Double Patty+ 1 King Peri Peri Fries + 1 Veggie Strips + 2 Pepsi (M)',
    'price': 440,
    'rate': 1.4,
    'review': 102,
    'type': true,
    'category': 'Burger'
  },
  {
    'name': 'Maharaja Mac',
    'image': 'assets/burgerImage.png',
    'decs':
        '2 Crispy Veg Double Patty+ 1 King Peri Peri Fries + 1 Veggie Strips + 2 Pepsi (M)',
    'price': 440,
    'rate': 3.4,
    'review': 102,
    'type': true,
    'category': 'Burger'
  },
  {
    'name': 'Maharaja Mac',
    'image': 'assets/burgerImage.png',
    'decs':
        '2 Crispy Veg Double Patty+ 1 King Peri Peri Fries + 1 Veggie Strips + 2 Pepsi (M)',
    'price': 440,
    'rate': 3.4,
    'review': 102,
    'type': false,
    'category': 'Burger'
  },
  {
    'name': 'Maharaja Mac',
    'image': 'assets/burgerImage.png',
    'decs':
        '2 Crispy Veg Double Patty+ 1 King Peri Peri Fries + 1 Veggie Strips + 2 Pepsi (M)',
    'price': 440,
    'rate': 4.0,
    'review': 102,
    'type': false,
    'category': 'Burger'
  },
];

class TopPurchaseSec extends StatefulWidget {
  const TopPurchaseSec({Key? key}) : super(key: key);

  @override
  State<TopPurchaseSec> createState() => _TopPurchaseSecState();
}

class _TopPurchaseSecState extends State<TopPurchaseSec> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Text(
                'Top Purchase',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                'View all',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(height: 128, child: topPurchaseItemList())
      ],
    );
  }
}

Widget topPurchaseItemList() => ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: toppurchaseItems.length,
      itemBuilder: (context, index) => FoodCard(
          type: toppurchaseItems[index]['type'],
          name: toppurchaseItems[index]['name'],
          image: toppurchaseItems[index]['image'],
          decs: toppurchaseItems[index]['category'],
          price: toppurchaseItems[index]['price'],
          rate: toppurchaseItems[index]['rate'],
          reviews: toppurchaseItems[index]['review']),
    );
