import 'package:flutter/material.dart';

class Screen {
  Screen._();

  static Size size(BuildContext context) => MediaQuery.of(context).size;

  static double sizeHeight({
    BuildContext? context,
    double screenHeight = 0,
    double dividedBy = 1,
    double multipliedBy = 1,
    double subtract = 0,
  }) {
    assert(context != null || screenHeight != 0);

    double height =
        (context != null) ? size(context).width : screenHeight;

    return ((height - subtract) * multipliedBy) / dividedBy;
  }

  static double sizeWidth({
    BuildContext? context,
    double screenWidth = 0,
    double dividedBy = 1,
    double multipliedBy = 1,
    double subtract = 0,
  }) {
    assert(context != null || screenWidth != 0);

    double width = (context != null) ? size(context).width : screenWidth;

    return ((width - subtract) * multipliedBy) / dividedBy;
  }

  static double ratio(BuildContext context) => size(context).aspectRatio;
}