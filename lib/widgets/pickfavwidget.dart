import 'package:flutter/material.dart';
import 'package:restroapp/Data/itemlistdata.dart';

class PickFavWidget extends StatefulWidget {
  const PickFavWidget({Key? key}) : super(key: key);

  @override
  State<PickFavWidget> createState() => _PickFavWidgetState();
}

class _PickFavWidgetState extends State<PickFavWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: width < 440 ? 1 / 1.5 : 1 / 1,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0.5,
          crossAxisCount: width < 440 ? 4 : 6),
      itemCount: picFavList.length,
      itemBuilder: (context, index) => pickFav(
        name: picFavList[index]['name'],
        image: picFavList[index]['image'],
      ),
    );
  }
}

Widget pickFav({required String image, required String name}) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
            child: Image.asset(
          image,
          fit: BoxFit.fill,
          width: 80,
          height: 80,
        )),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )
      ],
    );
