import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String pageTitle;
  final Color titleColour;
  final double titleSize;
  final FontWeight titleFontWeight;
  const CustomTextWidget(
      {Key? key,
      required this.pageTitle,
      required this.titleColour,
      required this.titleSize,
      required this.titleFontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      pageTitle,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: titleColour,
        fontSize: titleSize,
        fontWeight: titleFontWeight,
      ),
    );
  }
}
