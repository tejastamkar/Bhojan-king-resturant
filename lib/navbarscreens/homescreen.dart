import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/widgets/bigfoodcards.dart';
import 'package:restroapp/widgets/flitre.dart';
import 'package:restroapp/widgets/topcategory.dart';
import 'package:restroapp/widgets/toppurchase.dart';

List imageDataItems = [
  'assets/carouselimage.png',
  'assets/carouselimage.png',
  'assets/carouselimage.png',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    int _current = 0;
    double height = MediaQuery.of(context).size.height;
    // final GlobalKey<ScaffoldState> _key = GlobalKey();

    // getIndcatorIndex(int index, CarouselPageChangedReason reason) {
    //   setState(() {
    //     _current = index;
    //   });
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: Image.asset('icons/main_logo.png'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              'icons/bell.svg',
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: height - 700,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 10),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            // setState(() {
                            //   _current = index;
                            // });
                          }),
                      items: imageDataItems.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(i));
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: CarouselIndicator(
                      height: 10,
                      width: 10,
                      cornerRadius: 10,
                      color: const Color.fromRGBO(0, 0, 0, 0.6),
                      activeColor: const Color.fromRGBO(0, 129, 100, 1),
                      count: imageDataItems.length,
                      index: _current,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 46, child: FliterSelector()),
              const TopCategorySec(),
              const TopPurchaseSec(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  'Nearby Deals',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 8 / 8.8,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 0,
                    crossAxisCount: 2),
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
