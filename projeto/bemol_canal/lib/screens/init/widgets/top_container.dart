import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/screen_size.dart';
import 'package:bemol_canal/constants/font_size.dart';
import 'package:bemol_canal/constants/colors.dart';

class TopContainer extends StatelessWidget {
  final String titleName;
  final ValueChanged<int> callback;
  final int? index;

  TopContainer({
    required this.titleName,
    required this.callback,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstColors.liteBlue,
        borderRadius: const BorderRadius.only(
          bottomLeft: const Radius.circular(150),
          bottomRight: const Radius.circular(40),
        ),
      ),
      width: Screen.sizeWidth(context: context),
      height: Screen.sizeHeight(context: context, dividedBy: 9),
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                titleName,
                style: TextStyle(
                  fontFamily: 'Roboto-Medium',
                  color: ConstColors.white,
                  fontSize: FontSize.headline,
                  shadows: const [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 1,
                      color: ConstColors.blue,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => callback(index ?? 0),
              child: Icon(
                Icons.arrow_upward,
                color: ConstColors.white,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                primary: ConstColors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
