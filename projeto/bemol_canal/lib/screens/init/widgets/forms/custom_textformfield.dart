import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/colors.dart';
import 'package:flutter/services.dart';

Widget CustomTextFormField({
  required Function validator,
  Function? onChanged,
  // TODO: DEVOLVER REQUIRED
  TextEditingController? controller,
  required labelText,
  required hintText,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? textInputType,
  double? width,
  IconData? icon,
  String? prefixText,
}) {
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
        icon: icon,
        prefixText: prefixText,
        labelText: labelText,
        hintText: hintText,
      ),
    ),
  );
}

InputDecoration textFieldStyle(
    {IconData? icon,
    String? prefixText,
    String labelText = "",
    String hintText = ""}) {
  return InputDecoration(
    prefixText: prefixText,
    prefixIcon: (icon == null) ? null : Icon(icon),
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
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ConstColors.blue, width: 1.4),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ConstColors.red, width: 1.4),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ConstColors.red, width: 1.4),
    ),
  );
}
