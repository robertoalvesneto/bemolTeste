import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final ValueChanged<int> onComeBackButtonPressed;

  const SignInScreen({Key? key, required this.onComeBackButtonPressed})
      : super(key: key);

  @override
  _SignInScreenState createState() =>
      _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            children: [
              Text("Logar"),
              ElevatedButton(
                onPressed: () => widget.onComeBackButtonPressed(1),
                child: const Text("Voltar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
