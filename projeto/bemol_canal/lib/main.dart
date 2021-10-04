import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/colors.dart';
import 'package:bemol_canal/constants/font_size.dart';

import 'package:bemol_canal/screens/home_screen.dart';
import 'package:bemol_canal/screens/init/init_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Bemol Canal",
      home: InitScreen(),
      initialRoute: "/",
      routes: {
        "/home": (context) => HomeScreen(),
        "/init": (context) => InitScreen(),
      },
      theme: ThemeData(
        fontFamily: 'Roboto',
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontFamily: 'Roboto-Medium',
              fontSize: FontSize.button,
              color: ConstColors.blue,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontFamily: 'Roboto-Medium',
              fontSize: FontSize.button,
            ),
          ),
        ),
      ),
    ),
  );
}
