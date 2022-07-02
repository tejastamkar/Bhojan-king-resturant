import 'package:flutter/material.dart';
import 'package:restroapp/Data/restrodata.dart';
import 'package:restroapp/widgets/flitre.dart';
import 'package:restroapp/widgets/restrocard.dart';

class PopularRestro extends StatefulWidget {
  const PopularRestro({Key? key}) : super(key: key);

  @override
  State<PopularRestro> createState() => _PopularRestroState();
}

class _PopularRestroState extends State<PopularRestro> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Popular Resturants',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SizedBox(height: 46, child: FliterSelector()),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 0,
              crossAxisCount: width < 440
                  ? 2
                  : orientation == Orientation.landscape
                      ? 5
                      : 4),
          itemCount: restroCardList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RestroCardWidget(
              name: restroCardList[index]['name'],
              place: restroCardList[index]['place'],
              rate: restroCardList[index]['rate'].toDouble(),
              image: restroCardList[index]['image'],
            ),
          ),
        ),
      ],
    );
  }
}
