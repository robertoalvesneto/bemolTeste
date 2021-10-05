import 'package:flutter/material.dart';

import 'package:bemol_canal/helpers/auth.dart';

import 'package:bemol_canal/constants/colors.dart';
import 'package:bemol_canal/constants/font_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Bemol Canal"),
            IconButton(
                onPressed: () => handlerSignOutButton(context),
                icon: Icon(Icons.logout)),
          ],
        ),
      ),
      body: Center(
        child: _message(),
      ),
    );
  }

  // --- FUNCTIONS
  Future<void> handlerSignOutButton(BuildContext context) async {
    await FirebaseAuthh.singleton().signOut();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed('/init');
    });
  }

  // --- WIDGETS

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
