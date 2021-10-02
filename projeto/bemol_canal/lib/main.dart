import 'package:flutter/material.dart';

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
    ),
  );
}
