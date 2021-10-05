import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/colors.dart';
import 'package:flutter/services.dart';

Widget CustomTextFormField({
  required Function validator,
  Function? onChanged,
  required TextEditingController controller,
  required labelText,
  required hintText,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? textInputType,
  double? width,
  IconData? icon,
  String? prefixText,
  bool? isLogin,
}) {
  /// Acredito que o 'isLogin' nao seja a solucao mas elegante, contudo
  /// ele economiza bastante espaco, pois essas cores teriam que ser passadas
  /// pela instancia e teria que ter o tratamento essa classe.

  return Container(
    width: width ?? null,
    padding: EdgeInsets.symmetric(vertical: 20),
    child: TextFormField(
      keyboardType: textInputType,
      validator: (value) => validator(value),
      onChanged: (value) => onChanged!(value),
      controller: controller,
      inputFormatters: inputFormatters,
      decoration: textFieldStyle(
        isLogin: (isLogin == true) ? true : false,
        icon: icon,
        prefixText: prefixText,
        labelText: labelText,
        hintText: hintText,
      ),
    ),
  );
}

InputDecoration textFieldStyle({
  IconData? icon,
  String? prefixText,
  String labelText = "",
  String hintText = "",
  bool isLogin = false,
}) {
  return InputDecoration(
    filled: isLogin,
    fillColor: Colors.white,
    prefixText: prefixText,
    labelStyle: TextStyle(
      color: isLogin ? Colors.black45 : null,
    ),
    prefixIcon: (icon == null)
        ? null
        : Icon(
            icon,
            color: isLogin ? Colors.black45 : null,
          ),
    contentPadding: const EdgeInsets.only(left: 10),
    labelText: labelText,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.black45,
      fontFamily: "Roboto",
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black45, width: 1.4),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: isLogin ? ConstColors.blue : ConstColors.black, width: 1.4),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ConstColors.red, width: 1.4),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ConstColors.red, width: 1.4),
    ),
  );
}
