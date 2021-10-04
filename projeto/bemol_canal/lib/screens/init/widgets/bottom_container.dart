import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/screen_size.dart';
import 'package:bemol_canal/constants/colors.dart';

class BottomContainer extends StatelessWidget {
  final String titleName;
  final VoidCallback callback;

  BottomContainer({
    required this.titleName,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstColors.liteBlue,
        borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(50),
          topRight: const Radius.circular(150),
        ),
      ),
      width: Screen.sizeWidth(context: context),
      height: Screen.sizeHeight(context: context, dividedBy: 20),
      child: null,
    );
  }
}
