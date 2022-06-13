import 'package:flutter/material.dart';
import 'package:restroapp/widgets/filtersheet.dart';

List itemList = ['Veg', 'Non-veg', 'Nearest', 'Top Rated', 'More+'];

class FliterSelector extends StatefulWidget {
  const FliterSelector({Key? key}) : super(key: key);

  @override
  State<FliterSelector> createState() => _FliterSelectorState();
}

class _FliterSelectorState extends State<FliterSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        selector(name: 'Veg'),
        selector(name: 'Non-veg'),
        selector(name: 'Nearest'),
        selector(name: 'Top Rated'),
        InkWell(
            onTap: (() => filterSheet(context)),
            child: selector(name: 'More+')),
      ],
    );
  }
}

Widget selector({required String name}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Container(
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 0.5,
          color: const Color.fromRGBO(110, 107, 107, 1),
          style: BorderStyle.solid,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}
