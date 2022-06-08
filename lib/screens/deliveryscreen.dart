import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/Data/itemlistdata.dart';
import 'package:restroapp/widgets/bigfoodcards.dart';
import 'package:restroapp/widgets/brandwidget.dart';
import 'package:restroapp/widgets/flitre.dart';
import 'package:restroapp/widgets/pickfavwidget.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        title: const Text(
          'Delivery',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Top Brands',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: width< 440 ? width / 3: width / 7,
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: brandList.length,
                    itemBuilder: (context, index) => BrandWidget(
                        image: brandList[index]['image'],
                        name: brandList[index]['name'])),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Todays Offers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height:  width <440 ? width / 3: width/5,
                  aspectRatio: 16 / 9,
                  viewportFraction: width <440 ?0.8: 0.4,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.easeInOutBack,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
                items: offerList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.asset(
                        i,
                        height: width <440 ? 100: 140,
                        fit: BoxFit.fill,
                      );
                    },
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(height: 46, child: FliterSelector()),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Pick your Favourites',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const PickFavWidget(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Popular Resturants around you',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio:  1 /1.2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 0,
                    crossAxisCount:  width < 440 ?  2: 5),
                itemCount: foodItem.length,
                itemBuilder: (context, index) => BigFoodCard(
                  name: foodItem[index]['name'],
                  item: foodItem[index]['item'],
                  rate: foodItem[index]['rate'],
                  time: foodItem[index]['time'],
                  image: foodItem[index]['image'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
