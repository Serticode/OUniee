import 'package:flutter/material.dart';
import 'package:ouniee/widgets/custom_text_widget.dart';

Color light = const Color(0XFFF7F8FC);
Color lightGrey = const Color(0XFFA4A6B3);
Color dark = const Color(0XFF363740);
Color active = Colors.blue.shade900;

final InputDecoration theTextFieldDecorator = InputDecoration(
  label: CustomTextWidget(
      pageTitle: "Full Name: ",
      titleColour: active,
      titleSize: 18.0,
      titleFontWeight: FontWeight.w600),
  filled: true,
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: active,
    ),
  ),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: Colors.red.shade900,
    ),
  ),
);
