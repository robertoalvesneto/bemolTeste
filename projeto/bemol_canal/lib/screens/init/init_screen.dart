import 'package:bemol_canal/constants/font_size.dart';
import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/screen_size.dart';
import 'package:bemol_canal/constants/colors.dart';

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
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: _slider ? Axis.vertical : Axis.horizontal,
      controller: _pageController,
      children: [
        SignInScreen(onComeBackButtonPressed: goBackInitScreen),
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
                      Logo(),
                      Message(),
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
                  child: Buttons(),
                ),
              ],
            ),
          ),
        ),
        SignUpScreen(onComeBackButtonPressed: goBackInitScreen)
      ],
    );
  }

  Widget Logo() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: Screen.sizeWidth(
          context: context,
          multipliedBy: (Screen.ratio(context) < 9 / 16) ? 0.6 : 0.5),
      child: Image.asset("assets/images/logo_bemol.png"),
    );
  }

  Widget Message() {
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

  Widget Buttons() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InitButton(
            text: "Logar",
            slider: false,
            index: 0,
          ),
          SizedBox(
            height: 20,
          ),
          InitButton(
            text: "Cadastrar",
            slider: true,
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget InitButton({
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
          changeScrollDirection(slider);
          goBackInitScreen(index);
        },
        child: Text(text),
      ),
    );
  }

  Future<void> goBackInitScreen(int index) {
    return _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linearToEaseOut,
    );
  }

  void changeScrollDirection(bool slider) {
    setState(() {
      _pageViewSize = Screen.size(context);
      _slider = slider;

      _pageController.position.applyViewportDimension(
          _slider ? _pageViewSize!.height : _pageViewSize!.width);
    });
  }
}
