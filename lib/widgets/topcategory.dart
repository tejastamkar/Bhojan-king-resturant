import 'package:flutter/material.dart';
import 'package:restroapp/screens/fooditemscreen.dart';

List category = [
  {'name': "Burger", 'image': "assets/burger.png"},
  {'name': "pizza", 'image': 'assets/pizza.png'},
  {'name': "Momos", 'image': 'assets/momos.png'},
  {'name': "Noodles", 'image': 'assets/noodles.png'},
  {'name': "Taco", 'image': 'assets/taco.png'},
  {'name': "Ice Cream", 'image': 'assets/ice_cream.png'},
  {'name': "Coffee", 'image': 'assets/coffee.png'},
  {'name': "Sandwich", 'image': 'assets/sandwich.png'},
];

class TopCategorySec extends StatefulWidget {
  const TopCategorySec({Key? key}) : super(key: key);

  @override
  State<TopCategorySec> createState() => _TopCategorySecState();
}

class _TopCategorySecState extends State<TopCategorySec> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Widget categoryCards({required String name, required String image}) =>
        Column(
          children: [
            Image.asset(
              image,
              width: width < 441 ? 60 : 120,
              fit: BoxFit.fill,
            ),
            Text(name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
          ],
        );
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
        SizedBox(
          height: width < 441 ? width / 2 : width / 3,
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 1,
                  crossAxisCount: width < 441 ? 4 : 5),
              itemCount: category.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodItemScreen(
                                title: category[index]['name'],
                                image: category[index]['image'])))),
                    child: categoryCards(
                        name: category[index]['name'],
                        image: category[index]['image']),
                  )),
        ),
      ],
    );
  }
}
