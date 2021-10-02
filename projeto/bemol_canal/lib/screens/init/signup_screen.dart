import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onComeBackButtonPressed;

  const SignUpScreen({Key? key, required this.onComeBackButtonPressed})
      : super(key: key);

  @override
  _SignUpScreenState createState() =>
      _SignUpScreenState(onComeBackButtonPressed);
}

class _SignUpScreenState extends State<SignUpScreen> {
  final VoidCallback onComeBackButtonPressed;

  _SignUpScreenState(this.onComeBackButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: Center(
          child: Column(
            children: [
              Text("Cadastrar"),
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
