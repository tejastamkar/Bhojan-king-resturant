import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget foodTag({required bool type}) => Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('icons/foodtag.svg',
            color: type ? Colors.green : Colors.red),
        Padding(
          padding: const EdgeInsets.all(3),
          child: type
              ? const Text('Veg',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600))
              : const Text('Non\nVeg',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.w600)),
        )
      ],
    );
