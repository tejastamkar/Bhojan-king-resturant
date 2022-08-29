import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restroapp/Data/cartdata.dart';

class OrderFoodCard extends StatefulWidget {
  final String image, itemName;
  final int price, count, index;
  final bool vn;
  const OrderFoodCard(
      {Key? key,
      required this.count,
      required this.image,
      required this.itemName,
      required this.vn,
      required this.price,
      required this.index})
      : super(key: key);

  @override
  State<OrderFoodCard> createState() => _OrderFoodCardState();
}

class _OrderFoodCardState extends State<OrderFoodCard> {
  @override
  Widget build(BuildContext context) {
    int counter = widget.count;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            width: 90,
            height: 70,
            child: Image.asset(widget.image),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                widget.itemName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                'icons/indicator.svg',
                color: widget.vn ? Colors.green : Colors.red,
              )
            ],
          ),
          Text(
            '₹${widget.price}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Customize',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor),
              ),
              const SizedBox(
                width: 5,
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 10,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          )
        ]),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: counter == 0
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.all(5)),
                        child: const Text('ADD'),
                      )
                    : Card(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                onTap: () => {
                                  setState(() {
                                    counter--;
                                  }),
                                  removeCart(index: widget.index)
                                },
                                child: Container(
                                  width: 10,
                                  height: 2,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            Text(
                              '$counter',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: () => {
                                setState(() {
                                  counter++;
                                }),
                                addCart(index: widget.index)
                              },
                              child: Icon(Icons.add,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
