import 'package:flutter/material.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/widgets/bigfoodcards.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Favourite',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  crossAxisCount: width < 440 ? 2 : 5),
              itemCount: favFood.length,
              itemBuilder: (context, index) => BigFoodCard(
                name: favFood[index]['name'],
                item: favFood[index]['item'],
                rate: favFood[index]['rate'],
                time: favFood[index]['time'],
                image: favFood[index]['image'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
