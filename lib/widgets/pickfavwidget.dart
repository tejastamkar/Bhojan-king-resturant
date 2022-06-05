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
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 4 / 4.5,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0.5,
          crossAxisCount: 4),
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
        Image.asset(image),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )
      ],
    );
