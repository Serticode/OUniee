import 'package:flutter/material.dart';

//!CONSTANT SCREEN SIZES
const int _largeScreenSize = 1366;
const int _mediumScreenSize = 768;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      required this.mediumScreen,
      required this.smallScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < _mediumScreenSize;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= _mediumScreenSize &&
      MediaQuery.of(context).size.width < _largeScreenSize;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= _largeScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double _screenWidth = constraints.maxWidth;
      if (_screenWidth >= _largeScreenSize) {
        return largeScreen;
      } else if (_screenWidth < _largeScreenSize &&
          _screenWidth >= _mediumScreenSize) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    });
  }
}
