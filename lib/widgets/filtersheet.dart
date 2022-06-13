import 'package:flutter/material.dart';

Future filterSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) => SizedBox(
      height: 200,
      child: Column(
        children: [
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
                  onPressed: () {},
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
        ],
      ),
    ),
  );
}
