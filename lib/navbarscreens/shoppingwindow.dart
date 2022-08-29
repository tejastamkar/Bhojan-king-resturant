import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/Data/itemlistdata.dart';
import 'package:restroapp/screens/brandscreen.dart';
import 'package:restroapp/widgets/bigfoodcards.dart';
import 'package:restroapp/widgets/flitre.dart';
import 'package:restroapp/widgets/pickfavwidget.dart';

class StreetVendors extends StatefulWidget {
  const StreetVendors({Key? key}) : super(key: key);

  @override
  State<StreetVendors> createState() => _StreetVendorsState();
}

class _StreetVendorsState extends State<StreetVendors> {
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
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: const Text('Street Vendors',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600))),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 46, child: FliterSelector()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Pick your Favaurite',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: width < 441 ? 1 / 1.5 : 1 / 1,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0.5,
                  crossAxisCount: width < 441 ? 4 : 7),
              itemCount: picFavList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => BrandScreen(
                            title: picFavFoodList[index]['name'])))),
                child: pickFav(
                  name: picFavFoodList[index]['name'],
                  image: picFavFoodList[index]['image'],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Popular Street vendors around you',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.2,
                  mainAxisSpacing: 0,
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
    );
  }
}
