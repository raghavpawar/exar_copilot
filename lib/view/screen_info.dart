import 'package:flutter/material.dart';

class Screen {
  static double? screenWidth;
  static double? screenHeight;

  static init(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
  }
}
