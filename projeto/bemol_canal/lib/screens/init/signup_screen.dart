import 'package:flutter/material.dart';

import 'package:bemol_canal/screens/init/widgets/forms/personal_data.dart';

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
      body: PersonalDataForm(onComeBackButtonPressed: onComeBackButtonPressed),
    );
  }
}