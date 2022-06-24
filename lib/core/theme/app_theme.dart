import 'package:flutter/material.dart';

abstract class AppTheme {
  AppTheme._();

  static const palette = <Color>[
    Color.fromRGBO(75, 135, 185, 1),
    Color.fromRGBO(192, 108, 132, 1),
    Color.fromRGBO(246, 114, 128, 1),
    Color.fromRGBO(248, 177, 149, 1),
    Color.fromRGBO(116, 180, 155, 1),
    Color.fromRGBO(0, 168, 181, 1),
    Color.fromRGBO(73, 76, 162, 1),
    Color.fromRGBO(255, 205, 96, 1),
    Color.fromRGBO(255, 240, 219, 1),
    Color.fromRGBO(238, 238, 238, 1)
  ];

  static const Color appColor = Color(0xff40590a);
  static const Color plantFulfillColor = Colors.blue;
  static const Color primaryColor = Color(0xffffffff);
  static const Color appBarColor = Color(0xffffffff);
  static const Color buttonAndIconColor = Color(0xff40590a);
  static const Color textColor = Color(0xff000000);
  static const Color errorColor = Color(0xffc60505);
  static Map<int, Color> primarySwatch = {
    50: const Color(0xff40590a).withOpacity(.1),
    100: const Color(0xff40590a).withOpacity(.2),
    200: const Color(0xff40590a).withOpacity(.3),
    300: const Color(0xff40590a).withOpacity(.4),
    400: const Color(0xff40590a).withOpacity(.5),
    500: const Color(0xff40590a).withOpacity(.6),
    600: const Color(0xff40590a).withOpacity(.7),
    700: const Color(0xff40590a).withOpacity(.8),
    800: const Color(0xff40590a).withOpacity(.9),
    900: const Color(0xff40590a).withOpacity(1),
  };
}