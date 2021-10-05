import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:bemol_canal/helpers/auth.dart';
import 'package:bemol_canal/helpers/database.dart';

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
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_message(), showUserData()],
          ),
        ));
  }

  // --- FUNCTIONS
  Future<void> handlerSignOutButton(BuildContext context) async {
    await FirebaseAuthh.singleton().signOut();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed('/init');
    });
  }

  Future userData() {
    final _db = FireDataBase.singleton();
    final _auth = FirebaseAuthh.singleton();

    return _db.getValuesByUID(uid: _auth.getUIDAuth());
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

  Widget showUserData() {
    return FutureBuilder(
        future: userData(),
        builder: (context, snapshot) {
          final map = snapshot.data.toString();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(map),
          );
        });
  }
}
