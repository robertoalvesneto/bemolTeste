import 'package:cpf_cnpj_validator/cpf_validator.dart';

bool cpfIsValid({required String cpf}) => CPFValidator.isValid(cpf);
