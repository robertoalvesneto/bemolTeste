import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/colors.dart';
import 'package:bemol_canal/constants/font_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bemol Canal"),
      ),
      body: Center(
        child: _message(),
      ),
    );
  }

  Widget _message() {
    return RichText(
      text: TextSpan(
        text: "Agora você faz parte da ",
        style: TextStyle(
          color: Colors.black,
          fontSize: FontSize.headline,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "B",
            style: TextStyle(
              color: ConstColors.red,
            ),
          ),
          TextSpan(
            text: "Mãe",
            style: TextStyle(
              color: ConstColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
