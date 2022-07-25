import 'package:flutter/material.dart';
import 'package:restroapp/widgets/filteritems.dart';

class FliterSheet extends StatefulWidget {
  const FliterSheet({Key? key}) : super(key: key);

  @override
  State<FliterSheet> createState() => _FliterSheetState();
}

class _FliterSheetState extends State<FliterSheet> {
  List filterItems = [const SortBy(), const VegNonVeg(), const DeliveryItem()];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    return SizedBox(
      height: heigth / 2,
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      relevance = false;
                      delivery = false;
                      rating = false;
                      hl = false;
                      lh = false;
                      veg = false;
                      nonveg = false;
                      delvi = false;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Clear All',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      selected = 0;
                    }),
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              right: selected == 0
                                  ? BorderSide(
                                      width: 3,
                                      color: Theme.of(context).primaryColor)
                                  : BorderSide.none)),
                      child: Text(
                        "Sort By",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: selected == 0
                                ? Theme.of(context).primaryColor
                                : Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 150,
                    color: Colors.grey.shade400,
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      selected = 1;
                    }),
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              right: selected == 1
                                  ? BorderSide(
                                      width: 3,
                                      color: Theme.of(context).primaryColor)
                                  : BorderSide.none)),
                      child: Text(
                        "Veg/Non-Veg",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: selected == 1
                                ? Theme.of(context).primaryColor
                                : Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 150,
                    color: Colors.grey.shade400,
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      selected = 2;
                    }),
                    child: Container(
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              right: selected == 2
                                  ? BorderSide(
                                      width: 3,
                                      color: Theme.of(context).primaryColor)
                                  : BorderSide.none)),
                      child: Text(
                        "Delivery time",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: selected == 2
                                ? Theme.of(context).primaryColor
                                : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              filterItems[selected]
            ],
          ),
        ]),
      ),
    );
  }
}

// Widget filterSheet(BuildContext context) {
//   // double width = MediaQuery.of(context).size.width;
//   return SizedBox(
//     child:
//   );
// }
