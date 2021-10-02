import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/screen_size.dart';
import 'package:bemol_canal/screens/init/signin_screen.dart';
import 'package:bemol_canal/screens/init/signup_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final PageController _pageController = PageController();
  bool _slider = true;
  Size? _pageViewSize;

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: _slider ? Axis.vertical : Axis.horizontal,
      controller: _pageController,
      children: [
        SignInScreen(onComeBackButtonPressed: goBackInitScreen),
        Scaffold(
          body: Container(
            width: Screen.sizeWidth(context: context),
            height: Screen.sizeHeight(context: context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    changeScrollDirection(false);
                    goBackInitScreen(index: 0);
                  },
                  child: const Text("pag 1"),
                ),
                ElevatedButton(
                  onPressed: () {
                    changeScrollDirection(true);
                    goBackInitScreen(index: 2);
                  },
                  child: const Text("pag 2"),
                )
              ],
            ),
          ),
        ),
        SignUpScreen(onComeBackButtonPressed: goBackInitScreen)
      ],
    );
  }

  Future<void> goBackInitScreen({int? index}) {
    return _pageController.animateToPage(
      (index == null) ? 1 : index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInCirc,
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
