import 'package:flutter/material.dart';

import 'package:bemol_canal/models/aux_register_user.dart';

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
  RegisterUser registerUser = RegisterUser();

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
            callbackPassRegisterUser: callbackPassRegisterUser,
            registerUser: this.registerUser,
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

  // --- FUNCTIONS

  Future<void> navigateFormsScreens(int index) {
    // Gerencia a navegacao entre as telas.
    return _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linearToEaseOut,
    );
  }

  void callbackPassRegisterUser(RegisterUser registerUser) {
    // Permite que as telas passagem os dados do usuario de volta.
    this.registerUser = registerUser;
    print(this.registerUser.birth);
  }
}
