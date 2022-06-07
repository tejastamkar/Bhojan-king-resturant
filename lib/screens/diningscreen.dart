import 'package:flutter/material.dart';
import 'package:restroapp/Data/restrodata.dart';
import 'package:restroapp/widgets/favrestrowidget.dart';
import 'package:restroapp/widgets/popularrestro.dart';

class DiningScreen extends StatefulWidget {
  const DiningScreen({Key? key}) : super(key: key);

  @override
  State<DiningScreen> createState() => _DiningScreenState();
}

class _DiningScreenState extends State<DiningScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        title: const Text(
          'Dining',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Find your Favourite place',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: SizedBox(
                height: width / 3.5,
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: favRestroList.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: FavRestroWidget(
                              image: favRestroList[index]['image'],
                              name: favRestroList[index]['title']),
                        )),
              ),
            ),
            const PopularRestro()
          ],
        ),
      ),
    );
  }
}
