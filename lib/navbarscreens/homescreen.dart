import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/Data/itemlistdata.dart';
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
  String location = 'Home';
  String dropdownvalue = 'En';

  // List of items in our dropdown menu

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            SvgPicture.asset('icons/map-pin.svg'),
            const SizedBox(
              width: 10,
            ),
            Text(location),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset('icons/chevron-down.svg')
          ],
        ),
        actions: [
          DropdownButton(
            value: dropdownvalue,
            alignment: AlignmentDirectional.center,

            icon: const Icon(Icons.keyboard_arrow_down),
            underline: const SizedBox(),
            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
            child: ClipOval(
              // borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://1.bp.blogspot.com/-arGwhEe2rG0/YTuyVzbS2NI/AAAAAAAAuUU/tKgGGBXs4Ig1kDG63eB8R_CKppQ8HY71QCLcBGAsYHQ/s920/Best-Profile-Pic-For-Boys%2B%25281%2529.png',
                width: 40,
                height: 10,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
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
                          height: height / 5,
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
                            setState(() {
                              _current = index;
                            });
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
                      // animationDuration: 100,
                      cornerRadius: 10,
                      color: const Color.fromARGB(250, 255, 255, 255),
                      activeColor: Theme.of(context).primaryColor,
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
