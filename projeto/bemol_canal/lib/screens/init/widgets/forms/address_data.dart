import 'dart:async';

import 'package:flutter/material.dart';

import 'package:bemol_canal/models/aux_register_user.dart';

import 'package:bemol_canal/helpers/mask_inputs.dart';
import 'package:bemol_canal/helpers/validate_cep.dart';

import 'package:bemol_canal/constants/screen_size.dart';

import 'package:bemol_canal/screens/init/widgets/top_container.dart';
import 'package:bemol_canal/screens/init/widgets/bottom_container.dart';
import 'package:bemol_canal/screens/init/widgets/forms/custom_textformfield.dart';

class AdressDataForm extends StatefulWidget {
  final ValueChanged<int> onNavigatorButtonPressed;
  final ValueChanged<RegisterUser> callbackPassRegisterUser;
  final RegisterUser registerUser;

  const AdressDataForm({
    Key? key,
    required this.onNavigatorButtonPressed,
    required this.callbackPassRegisterUser,
    required this.registerUser,
  }) : super(key: key);

  @override
  _AdressDataFormState createState() {
    return _AdressDataFormState();
  }
}

class _AdressDataFormState extends State<AdressDataForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _homeController = TextEditingController();
  TextEditingController _complementController = TextEditingController();
  TextEditingController _referenceController = TextEditingController();

  bool cepIsValid = false;

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
              titleName: "Endereço",
              callback: widget.onNavigatorButtonPressed,
              index: 0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _cep(),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 180,
                          child: _state(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _district(),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 100,
                          child: _home(),
                        ),
                      ],
                    ),
                    _street(),
                    _complement(),
                    _reference(),
                    ElevatedButton(
                      onPressed: () => _handlerSubmitButton(),
                      child: const Text('Continuar'),
                    ),
                  ],
                ),
              ),
            ),
            BottomContainer(),
          ],
        ),
      ),
    );
  }

  // --- FUNCTIONS

  void _handlerSubmitButton() {
    if (_formKey.currentState!.validate()) {
      // Preenchendo dados
      widget.registerUser.addAddress(
        cep: _cepController.text,
        state: _stateController.text,
        district: _districtController.text,
        street: _streetController.text,
        home: _homeController.text,
        complement: _complementController.text,
        reference: _referenceController.text,
      );
      
      // Passando dados
      widget.callbackPassRegisterUser(widget.registerUser);

      // Trocando de tela
      widget.onNavigatorButtonPressed(2);
    }
  }

  Future<void> _validateCep(String value) async {
    String _cep = value;
    if (_cep.length >= 9) {
      _cep = _cep.replaceAll('-', '');
      try {
        await validateCep(cep: _cep).timeout(Duration(seconds: 5)).then(
            (Map? map) {
          _setValuesInTextFormFields(map);

          setState(() => cepIsValid = (map?['erro'] == true) ? false : true);
        }, onError: (value) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Falha ao recuperar dados com o CEP')));

          setState(() => cepIsValid = false);
        });
      } on TimeoutException catch (_) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Falha ao recuperar dados com o CEP')));
        setState(() => cepIsValid = false);
      }
    }
  }

  void _setValuesInTextFormFields(Map? map) {
    _stateController.text = map?['localidade'] ?? '';
    _districtController.text = map?['bairro'] ?? '';
    _complementController.text = map?['complemento'] ?? '';
    _streetController.text = map?['logradouro'] ?? '';
  }

  // --- WIDGETS
  Widget _cep() {
    final _cepMask = ConcretMask().cepInputFormater();
    return CustomTextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'O campo não pode ser vazio';
        } else if (value.length != 9) {
          return 'Termine de inserir o cep';
        } else if (!cepIsValid) {
          return 'CEP invalido';
        }

        return null;
      },
      onChanged: (value) {
        _validateCep(value);
      },
      textInputType: TextInputType.number,
      controller: _cepController,
      inputFormatters: [_cepMask],
      labelText: "CEP",
      hintText: "9999-999",
    );
  }

  Widget _state() {
    return CustomTextFormField(
      validator: (String value) =>
          (value.isEmpty) ? 'O campo não pode ser vazio' : null,
      controller: _stateController,
      labelText: "Estado",
      hintText: "",
    );
  }

  Widget _district() {
    return CustomTextFormField(
      validator: (String value) =>
          (value.isEmpty) ? 'O campo não pode ser vazio' : null,
      controller: _districtController,
      labelText: "Bairro",
      hintText: "",
    );
  }

  Widget _street() {
    return CustomTextFormField(
      validator: (String value) =>
          (value.isEmpty) ? 'O campo não pode ser vazio' : null,
      controller: _streetController,
      labelText: "Rua",
      hintText: "",
    );
  }

  Widget _home() {
    return CustomTextFormField(
      validator: (String value) => (value.isEmpty) ? 'Campo vazio' : null,
      controller: _homeController,
      textInputType: TextInputType.number,
      labelText: "Casa",
      hintText: "",
    );
  }

  Widget _complement() {
    return CustomTextFormField(
      validator: (String value) =>
          (value.isEmpty) ? 'O campo não pode ser vazio' : null,
      controller: _complementController,
      labelText: "Complemento",
      hintText: "",
    );
  }

  Widget _reference() {
    return CustomTextFormField(
      validator: (String value) =>
          (value.isEmpty) ? 'O campo não pode ser vazio' : null,
      controller: _referenceController,
      labelText: "Referencia",
      hintText: "",
    );
  }
}
