import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/Data/itemlistdata.dart';
import 'package:restroapp/screens/brandscreen.dart';
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
    Orientation orientation = MediaQuery.of(context).orientation;
    Widget imageCarousel() => Dialog(
          child: CarouselSlider(
            options: CarouselOptions(
              // height: width < 441 ? height / 5 : height / 3,
              // aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: offerList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        i,
                        fit: BoxFit.fill,
                        width: width,
                      ));
                },
              );
            }).toList(),
          ),
        );
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
                height: width < 441 ? width / 3 : width / 6,
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: brandList.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BrandScreen(
                                        title: brandList[index]['name'])))),
                            child: BrandWidget(
                                image: brandList[index]['image'],
                                name: brandList[index]['name']),
                          ),
                        )),
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
                  height: width < 441 ? width / 3 : width / 5,
                  aspectRatio: 16 / 9,
                  viewportFraction: width < 441 ? 0.8 : 0.4,
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
                      return InkWell(
                        onTap: (() => showDialog(
                            context: context,
                            builder: (context) => imageCarousel())),
                        child: Image.asset(
                          i,
                          height: width < 441 ? 100 : 140,
                          fit: BoxFit.fill,
                        ),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 0,
                    crossAxisCount: width < 441
                        ? 2
                        : orientation == Orientation.landscape
                            ? 5
                            : 4),
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
