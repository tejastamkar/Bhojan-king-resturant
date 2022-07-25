import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

bool relevance = false,
    delivery = false,
    rating = false,
    hl = false,
    lh = false,
    veg = false,
    nonveg = false,
    delvi = false;

class SortBy extends StatefulWidget {
  const SortBy({Key? key}) : super(key: key);

  @override
  State<SortBy> createState() => _SortByState();
}

class _SortByState extends State<SortBy> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioButton(
            description: "Relevance (Default)",
            value: !relevance,
            groupValue: false,
            onChanged: (value) => setState(
              () => relevance = value as bool,
            ),
            activeColor: Theme.of(context).primaryColor,
          ),
          RadioButton(
            description: "Delivery Time",
            value: !delivery,
            groupValue: false,
            onChanged: (value) => setState(
              () => delivery = value as bool,
            ),
            activeColor: Theme.of(context).primaryColor,
          ),
          RadioButton(
            description: "Rating",
            value: !rating,
            groupValue: false,
            onChanged: (value) => setState(
              () => rating = value as bool,
            ),
            activeColor: Theme.of(context).primaryColor,
          ),
          RadioButton(
            description: "Cost Low to High",
            value: !lh,
            groupValue: false,
            onChanged: (value) => setState(
              () => lh = value as bool,
            ),
            activeColor: Theme.of(context).primaryColor,
          ),
          RadioButton(
            description: "Cost High to low",
            value: !hl,
            groupValue: false,
            onChanged: (value) => setState(
              () => hl = value as bool,
            ),
            activeColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

class VegNonVeg extends StatefulWidget {
  const VegNonVeg({Key? key}) : super(key: key);

  @override
  State<VegNonVeg> createState() => _VegNonVegState();
}

class _VegNonVegState extends State<VegNonVeg> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioButton(
            description: "Veg",
            value: !veg,
            groupValue: false,
            onChanged: (value) => setState(
              () => veg = value as bool,
            ),
            activeColor: Theme.of(context).primaryColor,
          ),
          RadioButton(
            description: "Non Veg",
            value: !nonveg,
            groupValue: false,
            onChanged: (value) => setState(
              () => nonveg = value as bool,
            ),
            activeColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

class DeliveryItem extends StatefulWidget {
  const DeliveryItem({Key? key}) : super(key: key);

  @override
  State<DeliveryItem> createState() => _DeliveryItemState();
}

class _DeliveryItemState extends State<DeliveryItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioButton(
            description: "Less than 45 mins",
            value: !delvi,
            groupValue: false,
            onChanged: (value) => setState(
              () => delvi = value as bool,
            ),
            activeColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

class RiskItem extends StatefulWidget {
  const RiskItem({Key? key}) : super(key: key);

  @override
  State<RiskItem> createState() => _RiskItemState();
}

class _RiskItemState extends State<RiskItem> {
  bool low = false,
      mlow = false,
      moderate = false,
      mHigh = false,
      high = false,
      vHigh = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                  value: low,
                  onChanged: (value) => setState(() {
                        low = value!;
                      })),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Low",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: mlow,
                  onChanged: (value) => setState(() {
                        mlow = value!;
                      })),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Moderately low",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: moderate,
                  onChanged: (value) => setState(() {
                        moderate = value!;
                      })),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Moderate",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: mHigh,
                  onChanged: (value) => setState(() {
                        mHigh = value!;
                      })),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Moderately High",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: high,
                  onChanged: (value) => setState(() {
                        high = value!;
                      })),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "High",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: vHigh,
                  onChanged: (value) => setState(() {
                        vHigh = value!;
                      })),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Very High",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InvestTypeItems extends StatefulWidget {
  const InvestTypeItems({Key? key}) : super(key: key);

  @override
  State<InvestTypeItems> createState() => _InvestTypeItemsState();
}

class _InvestTypeItemsState extends State<InvestTypeItems> {
  bool sip = false, oneTime = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                  value: sip,
                  onChanged: (value) => setState(() {
                        sip = value!;
                      })),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "SIP",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: oneTime,
                  onChanged: (value) => setState(() {
                        oneTime = value!;
                      })),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "One - Time",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
