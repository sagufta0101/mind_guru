import 'package:endurance_app/theme/colors.dart';

import 'text_theme.dart';
import 'package:flutter/material.dart';

import 'text_style.dart';

// Light Theme
final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: CustomColors.scaffoldBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: AvenirTextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    textTheme: lightTextTheme,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ));

// Dark Theme
final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: darkTextTheme,
    iconTheme: const IconThemeData(
      color: Colors.white,
    )
    // Add more dark theme properties here
    );
