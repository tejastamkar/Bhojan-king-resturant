import 'package:flutter/material.dart';

List category = [
  {'name': "Burger", 'image': "assets/burger.png"},
  {'name': "pizza", 'image': 'assets/pizza.png'},
  {'name': "Momos", 'image': 'assets/momos.png'},
  {'name': "Noodles", 'image': 'assets/noodles.png'},
  {'name': "Taco", 'image': 'assets/taco.png'},
  {'name': "Ice Cream", 'image': 'assets/ice_cream.png'},
  {'name': "Coffee", 'image': 'assets/coffee.png'},
  {'name': "Sandwich", 'image': 'assets/sandwich.png'},
  // {'name': "Taco", 'image': 'assets/taco.png'},
];

class TopCategorySec extends StatefulWidget {
  const TopCategorySec({Key? key}) : super(key: key);

  @override
  State<TopCategorySec> createState() => _TopCategorySecState();
}

class _TopCategorySecState extends State<TopCategorySec> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Top Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 0, crossAxisSpacing: 0, crossAxisCount: 4),
            itemCount: category.length,
            itemBuilder: (context, index) => categoryCards(
                name: category[index]['name'],
                image: category[index]['image'])),
      ],
    );
  }
}

Widget categoryCards({required String name, required String image}) => Column(
      children: [
        Image.asset(
          image,
          width: 70,
        ),
        Text(name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
      ],
    );
