import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:bemol_canal/constants/screen_size.dart';
import 'package:bemol_canal/constants/colors.dart';
import 'package:bemol_canal/constants/font_size.dart';

import 'package:bemol_canal/screens/init/signin_screen.dart';
import 'package:bemol_canal/screens/init/signup_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final PageController _pageController = PageController(initialPage: 1);
  bool _slider = true;
  Size? _pageViewSize;


  @override
  void initState() {
    _userIsConnected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: _slider ? Axis.vertical : Axis.horizontal,
      controller: _pageController,
      children: [
        SignInScreen(onComeBackButtonPressed: _goBackInitScreen),
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: Screen.sizeWidth(context: context),
            height: Screen.sizeHeight(context: context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      _logo(),
                      _message(),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ConstColors.liteBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(150),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  width: Screen.sizeWidth(context: context),
                  height: Screen.sizeHeight(context: context, dividedBy: 2.5),
                  child: _buttons(),
                ),
              ],
            ),
          ),
        ),
        SignUpScreen(onComeBackButtonPressed: _goBackInitScreen)
      ],
    );
  }

  // --- FUNCTIONS
  void _userIsConnected() async {
    final _authFire = FirebaseAuth.instance;

    if (_authFire.currentUser != null)
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  Future<void> _goBackInitScreen(int index) {
    return _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linearToEaseOut,
    );
  }

  void _changeScrollDirection(bool slider) {
    setState(() {
      _pageViewSize = Screen.size(context);
      _slider = slider;

      _pageController.position.applyViewportDimension(
          _slider ? _pageViewSize!.height : _pageViewSize!.width);
    });
  }

  // --- WIDGETS

  Widget _logo() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: Screen.sizeWidth(
          context: context,
          multipliedBy: (Screen.ratio(context) < 9 / 16) ? 0.6 : 0.5),
      child: Image.asset("assets/images/logo_bemol.png"),
    );
  }

  Widget _message() {
    return RichText(
      text: TextSpan(
        text: "Bem vindo ao ",
        style: TextStyle(
          color: Colors.black,
          fontSize: FontSize.headline,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "Bemol",
            style: TextStyle(
              color: ConstColors.red,
            ),
          ),
          TextSpan(
            text: " Canal",
            style: TextStyle(
              color: ConstColors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _initButton(
            text: "Logar",
            slider: false,
            index: 0,
          ),
          SizedBox(
            height: 20,
          ),
          _initButton(
            text: "Cadastrar",
            slider: true,
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _initButton({
    required String text,
    required bool slider,
    required int index,
  }) {
    return Container(
      width: Screen.sizeWidth(context: context, dividedBy: 3 / 2),
      decoration: BoxDecoration(
        color: ConstColors.white,
        border: Border.all(color: ConstColors.red, width: 1.5),
        borderRadius: const BorderRadius.all(
          const Radius.circular(15.0),
        ),
      ),
      child: TextButton(
        onPressed: () {
          _changeScrollDirection(slider);
          _goBackInitScreen(index);
        },
        child: Text(text),
      ),
    );
  }
}
