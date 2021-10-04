import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/screen_size.dart';

import 'package:bemol_canal/screens/init/widgets/top_container.dart';
import 'package:bemol_canal/screens/init/widgets/bottom_container.dart';
import 'package:bemol_canal/screens/init/widgets/forms/custom_textformfield.dart';

class PersonalDataForm extends StatefulWidget {
  final ValueChanged<int> onComeBackButtonPressed;
  final ValueChanged<int> onContinueButtonPressed;

  const PersonalDataForm({
    Key? key,
    required this.onComeBackButtonPressed,
    required this.onContinueButtonPressed,
  }) : super(key: key);

  @override
  _PersonalDataFormState createState() {
    return _PersonalDataFormState();
  }
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  final _formKey = GlobalKey<FormState>();

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _birthData(context),
                          _gender(context),
                        ],
                      ),
                      _cpf(),
                      _rg(),
                      _number(),
                      ElevatedButton(
                        onPressed: () {
                          /*
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      */
                          widget.onContinueButtonPressed(1);
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
}

Widget _name() {
  return CustomTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    labelText: "Nome",
    hintText: "Ex: Joao Silva",
    icon: Icons.person,
  );
}

Widget _birthData(BuildContext context) {
  return CustomTextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      width: Screen.sizeWidth(context: context, dividedBy: 2),
      labelText: "Data Nascimento",
      hintText: "Ex: 14/12/1999",
      icon: Icons.cake);
}

Widget _gender(BuildContext context) {
  return CustomTextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      width: Screen.sizeWidth(context: context, dividedBy: 4),
      labelText: "Sexo",
      hintText: "Masculino",
      icon: Icons.transgender);
}

Widget _cpf() {
  return CustomTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    labelText: "CPF",
    hintText: "999.999.999-99",
    icon: Icons.perm_identity,
  );
}

Widget _rg() {
  return CustomTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    labelText: "RG",
    hintText: "99.999.999-0",
    icon: Icons.perm_identity,
  );
}

Widget _number() {
  return CustomTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    labelText: "Telefone Celular",
    hintText: "99 9 9999-9999",
    icon: Icons.phone,
    prefixText: "(55) ",
  );
}
