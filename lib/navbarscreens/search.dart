import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restroapp/Data/fooddata.dart';
import 'package:restroapp/widgets/bigfoodcards.dart';
import 'package:restroapp/widgets/exploreservice.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String location = 'Home';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            SvgPicture.asset('icons/map-pin.svg'),
            const SizedBox(
              width: 5,
            ),
            Text(location),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset('icons/chevron-down.svg')
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Row(children: [
                        SvgPicture.asset('icons/search.svg'),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: width - 200,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Find Food or Resturant',
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        'icons/sliders.svg',
                        width: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: width / 4,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.5,
                  initialPage: 2,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 10),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.easeInOutBack,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
                items: adsList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.asset(
                        i,
                        height: 80,
                      );
                    },
                  );
                }).toList(),
              ),
              const ExploreServiceWidget(),
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
