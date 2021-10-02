import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Bemol Canal",
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bemol Canal"),
      ),
      body: Container(),
    );
  }
}
