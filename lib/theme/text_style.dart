import 'package:flutter/material.dart';

// Define a custom text style using the Urbanist font
TextStyle AvenirTextStyle({
  double fontSize = 14.0,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.black,
  FontStyle fontStyle = FontStyle.normal,
  double height = 1.2,
  double letterSpacing = 0.0,
}) {
  return TextStyle(
    fontFamily: 'Avenir',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontStyle: fontStyle,
    height: height,
    letterSpacing: letterSpacing,
  );
}
