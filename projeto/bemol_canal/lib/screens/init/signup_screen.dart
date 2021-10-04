import 'package:flutter/material.dart';

import 'package:bemol_canal/screens/init/widgets/forms/personal_data.dart';
import 'package:bemol_canal/screens/init/widgets/forms/address_data.dart';
import 'package:bemol_canal/screens/init/widgets/forms/count_data.dart';

class SignUpScreen extends StatefulWidget {
  final ValueChanged<int> onComeBackButtonPressed;

  const SignUpScreen({Key? key, required this.onComeBackButtonPressed})
      : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: [
          PersonalDataForm(
            onComeBackButtonPressed: widget.onComeBackButtonPressed,
            onContinueButtonPressed: navigateFormsScreens,
          ),
          AdressDataForm(
            onButtonPressed: navigateFormsScreens,
          ),
          CountDataForm(
            onButtonPressed: navigateFormsScreens,
          ),
        ],
      ),
    );
  }

  Future<void> navigateFormsScreens(int index) {
    print(index);
    return _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linearToEaseOut,
    );
  }
}
