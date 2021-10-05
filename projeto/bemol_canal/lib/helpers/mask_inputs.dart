import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class Mask {
  brasilInputFormatter() {}

  cpfInputFormater() {}

  birthInputFormatter() {}
}

class ConcretMask extends Mask {

  @override
  MaskTextInputFormatter brasilInputFormatter() {
    var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) 9 ####-####',
      filter: {"#": RegExp(r'[0-9]')},
    );

    return maskFormatter;
  }

  @override
  MaskTextInputFormatter cpfInputFormater() {
    var maskFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
    );

    return maskFormatter;
  }

  @override
  MaskTextInputFormatter birthInputFormatter() {
    var maskFormatter = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
    );

    return maskFormatter;
  }

  @override
  MaskTextInputFormatter cepInputFormater() {
    var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
    );

    return maskFormatter;
  }
}