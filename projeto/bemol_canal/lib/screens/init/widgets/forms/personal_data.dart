import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:bemol_canal/models/aux_register_user.dart';

import 'package:bemol_canal/constants/screen_size.dart';
import 'package:bemol_canal/constants/colors.dart';
import 'package:bemol_canal/helpers/validate_cpf.dart';
import 'package:bemol_canal/helpers/mask_inputs.dart';

import 'package:bemol_canal/screens/init/widgets/top_container.dart';
import 'package:bemol_canal/screens/init/widgets/bottom_container.dart';
import 'package:bemol_canal/screens/init/widgets/forms/custom_textformfield.dart';

class PersonalDataForm extends StatefulWidget {
  final ValueChanged<int> onComeBackButtonPressed;
  final ValueChanged<int> onContinueButtonPressed;
  final ValueChanged<RegisterUser> callbackPassRegisterUser;
  final RegisterUser registerUser;

  const PersonalDataForm({
    Key? key,
    required this.onComeBackButtonPressed,
    required this.onContinueButtonPressed,
    required this.callbackPassRegisterUser,
    required this.registerUser,
  }) : super(key: key);

  @override
  _PersonalDataFormState createState() {
    return _PersonalDataFormState();
  }
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthController = TextEditingController();
  String _genderStr = 'sexo';
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _rgController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: Screen.sizeWidth(context: context),
        height: Screen.sizeHeight(context: context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopContainer(
              titleName: "Dados Pessoais",
              callback: widget.onComeBackButtonPressed,
              index: 1,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _name(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _birthData(),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 150,
                            child: _gender(),
                          ),
                        ],
                      ),
                      _cpf(),
                      _rg(),
                      _number(),
                      ElevatedButton(
                        onPressed: () {
                          //TODO: TIRAR ISSO. APENAS PARA TESTE
                          widget.onContinueButtonPressed(1);
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );

                            // Preenchendo dados
                            widget.registerUser.addPersonalData(
                                name: _nameController.text,
                                birth: _birthController.text,
                                gender: _genderStr,
                                cpf: _cpfController.text,
                                rg: _rgController.text,
                                number: _numberController.text);
                            // Passando dados
                            widget
                                .callbackPassRegisterUser(widget.registerUser);

                            // Trocando de tela
                            widget.onContinueButtonPressed(1);
                          }
                        },
                        child: const Text('Continuar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomContainer(),
          ],
        ),
      ),
    );
  }

  Widget _name() {
    return CustomTextFormField(
      validator: (String value) {
        final regexStr = "[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ'\s]";
        final nameSurname = RegExp('${regexStr} ${regexStr}');
        if (value.isEmpty) {
          return 'O campo não pode ser vazio';
        } else if (value.length <= 3 || !value.contains(nameSurname)) {
          return 'Insira o nome completo';
        } else if (value.length > 80) {
          return 'Muitos caracteres';
        } else if (value.contains(RegExp('~' + regexStr))) {
          return 'Caractere invalido';
        }

        return null;
      },
      controller: _nameController,
      labelText: "Nome",
      hintText: "Ex: Joao Silva",
      icon: Icons.person,
    );
  }

  Widget _birthData() {
    final _birthMask = ConcretMask().birthInputFormatter();
    return CustomTextFormField(
        validator: (String value) {
          DateFormat format = DateFormat("dd/mm/yyyy");
          if (value.isEmpty) {
            return 'O campo não pode ser vazio';
          } else if (value.length != 10) {
            return 'Termine de inserir a data';
          }
          try {
            (format.parseStrict(value));
          } on FormatException catch (_) {
            return 'Data invalida';
          }

          return null;
        },
        textInputType: TextInputType.datetime,
        controller: _birthController,
        inputFormatters: [_birthMask],
        width: Screen.sizeWidth(context: context, dividedBy: 2),
        labelText: "Nascimento",
        hintText: "14/12/1999",
        icon: Icons.cake);
  }

  Widget _gender() {
    return DropdownButtonFormField(
      value: _genderStr,
      validator: (value) {
        if (value == 'sexo') return 'escolha um';
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon((_genderStr == 'homem')
            ? Icons.male
            : ((_genderStr == 'mulher') ? Icons.female : Icons.transgender)),
        contentPadding: const EdgeInsets.only(left: 10),
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
      ),
      onChanged: (String? newValue) {
        setState(() {
          _genderStr = newValue!;
        });
      },
      items: <String>['sexo', 'homem', 'mulher', 'trans', 'outro']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _cpf() {
    final _cpfMask = ConcretMask().cpfInputFormater();
    return CustomTextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'O campo não pode ser vazio';
        } else if (value.length != 14) {
          return 'Preencha o campo';
        } else if (!cpfIsValid(cpf: value)) {
          return 'CPF invalido';
        }
        return null;
      },
      labelText: "CPF",
      hintText: "999.999.999-99",
      textInputType: TextInputType.number,
      controller: _cpfController,
      inputFormatters: [_cpfMask],
      icon: Icons.perm_identity,
    );
  }

  Widget _rg() {
    return CustomTextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'O campo não pode ser vazio';
        } else if (value.length < 8 || value.length > 14) {
          return 'invalido';
        }
        return null;
      },
      textInputType: TextInputType.number,
      controller: _rgController,
      labelText: "RG",
      hintText: "Ex: 999999990",
      icon: Icons.perm_identity,
    );
  }

  Widget _number() {
    final _numberMask = ConcretMask().brasilInputFormatter();
    return CustomTextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      textInputType: TextInputType.number,
      controller: _numberController,
      inputFormatters: [_numberMask],
      labelText: "Telefone Celular",
      hintText: "99 9 9999-9999",
      icon: Icons.phone,
      prefixText: "+55 ",
    );
  }
}
