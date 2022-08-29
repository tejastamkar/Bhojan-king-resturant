import 'package:flutter/material.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/widgets/foodcards.dart';

class BrandScreen extends StatefulWidget {
  final String title;
  const BrandScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
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
                  showdecs: false,
                  type: toppurchaseItems[index]['type'],
                  name: toppurchaseItems[index]['name'],
                  image: toppurchaseItems[index]['image'],
                  decs: toppurchaseItems[index]['decs'],
                  category: toppurchaseItems[index]['category'],
                  price: toppurchaseItems[index]['price'],
                  rate: toppurchaseItems[index]['rate'],
                  reviews: toppurchaseItems[index]['review'],
                  index: index,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
