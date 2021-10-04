import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback onComeBackButtonPressed;

  const SignInScreen({Key? key, required this.onComeBackButtonPressed})
      : super(key: key);

  @override
  _SignInScreenState createState() =>
      _SignInScreenState(onComeBackButtonPressed);
}

class _SignInScreenState extends State<SignInScreen> {
  final VoidCallback onComeBackButtonPressed;

  _SignInScreenState(this.onComeBackButtonPressed);

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
                onPressed: () => onComeBackButtonPressed(),
                child: const Text("Voltar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
