import 'package:endurance_app/theme/colors.dart';
import 'package:flutter/material.dart';

import 'text_style.dart';

final lightTextTheme = TextTheme(
  displayLarge: AvenirTextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w800,
    color: CustomColors.displayLarge,
  ),
  displayMedium: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
  displaySmall: AvenirTextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w100,
    color: Colors.black26,
    fontStyle: FontStyle.italic,
  ),
  headlineLarge: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: CustomColors.displayLarge,
  ),
  headlineMedium: AvenirTextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
    color: CustomColors.displayLarge,
  ),
  headlineSmall: AvenirTextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w800,
    color: CustomColors.displayLarge,
  ),
  titleLarge: AvenirTextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
  titleMedium: AvenirTextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
  titleSmall: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
  bodyLarge: AvenirTextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
  bodyMedium: AvenirTextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  bodySmall: AvenirTextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
  labelLarge: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
  labelMedium: AvenirTextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    letterSpacing: -1.0,
  ),
  labelSmall: AvenirTextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
    color: CustomColors.displayLarge,
    letterSpacing: -1.0,
  ),
);

final darkTextTheme = TextTheme(
  displayLarge: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  displayMedium: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  displaySmall: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  headlineLarge: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  headlineMedium: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  headlineSmall: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  titleLarge: AvenirTextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  titleMedium: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  titleSmall: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  bodyLarge: AvenirTextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  bodyMedium: AvenirTextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  bodySmall: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  labelLarge: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  labelMedium: AvenirTextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
  labelSmall: AvenirTextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  ),
);
