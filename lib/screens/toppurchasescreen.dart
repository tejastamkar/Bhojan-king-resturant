import 'package:flutter/material.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/widgets/foodcards.dart';

class TopPurchaseScreen extends StatefulWidget {
  const TopPurchaseScreen({Key? key}) : super(key: key);

  @override
  State<TopPurchaseScreen> createState() => _TopPurchaseScreenState();
}

class _TopPurchaseScreenState extends State<TopPurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Top Purchase',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: toppurchaseItems.length,
                itemBuilder: (context, index) => FoodCard(
                    showdecs: true,
                    type: toppurchaseItems[index]['type'],
                    name: toppurchaseItems[index]['name'],
                    image: toppurchaseItems[index]['image'],
                    decs: toppurchaseItems[index]['decs'],
                    category: toppurchaseItems[index]['category'],
                    price: toppurchaseItems[index]['price'],
                    rate: toppurchaseItems[index]['rate'],
                    reviews: toppurchaseItems[index]['review']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
