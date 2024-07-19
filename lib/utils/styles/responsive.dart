import 'dart:core';

import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  const Responsive(
      {required this.mobile,
        required this.tablet,
        required this.web,
        Key? key})
      : super(key: key);

  static isMobile(context) => (MediaQuery.of(context).size.width < 650);

  static isTablet(context) => (MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width > 650);

  static isWeb(context) => (MediaQuery.of(context).size.width > 1100);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1100) {
          return web;
        } else if (constraints.maxWidth > 650 && constraints.maxWidth < 1100) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

