import 'package:flutter/material.dart';

import 'package:bemol_canal/models/aux_register_user.dart';

import 'package:bemol_canal/screens/init/widgets/top_container.dart';
import 'package:bemol_canal/screens/init/widgets/forms/custom_textformfield.dart';

import 'package:bemol_canal/constants/screen_size.dart';

class CountDataForm extends StatefulWidget {
  final ValueChanged<int> onNavigatorButtonPressed;
  final ValueChanged<RegisterUser> callbackPassRegisterUser;
  final RegisterUser registerUser;

  const CountDataForm({
    Key? key,
    required this.onNavigatorButtonPressed,
    required this.callbackPassRegisterUser,
    required this.registerUser,
  }) : super(key: key);

  @override
  _CountDataFormState createState() {
    return _CountDataFormState();
  }
}

class _CountDataFormState extends State<CountDataForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
              titleName: "Dados da conta",
              callback: widget.onNavigatorButtonPressed,
              index: 1,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _email(),
                    _password(),
                    _confirmPassword(),
                    ElevatedButton(
                      onPressed: () => _handlerSubmitButton(),
                      child: const Text('Continuar'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }

  // --- FUNCTIONS

  void _handlerSubmitButton() {
    if (_formKey.currentState!.validate()) {
      // Preenchendo dados
      widget.registerUser.addAccount(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Passando dados
      widget.callbackPassRegisterUser(widget.registerUser);

      // Trocando de tela
      //widget.onNavigatorButtonPressed(2);
    }
  }

  // --- WIDGETS

  Widget _email() {
    return CustomTextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'O campo não pode ser vazio';
        } else if (!value.contains('@')) {
          return 'Email invalido';
        }

        return null;
      },
      textInputType: TextInputType.emailAddress,
      controller: _emailController,
      labelText: "Email",
      hintText: "joao123@gmail.com",
      icon: Icons.email,
    );
  }

  Widget _password() {
    return CustomTextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'O campo não pode ser vazio';
        } else if (value.length <= 5) {
          return 'Muito fraca';
        }
        return null;
      },
      textInputType: TextInputType.visiblePassword,
      controller: _passwordController,
      labelText: "Senha",
      hintText: "******",
      icon: Icons.vpn_key,
    );
  }

  Widget _confirmPassword() {
    return CustomTextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'O campo não pode ser vazio';
        } else if (value.length <= 5) {
          return 'Muito fraca';
        } else if (_passwordController.text != '' &&
            value != _passwordController.text) {
          return 'Senhas diferentes';
        }

        return null;
      },
      controller: _confirmPasswordController,
      textInputType: TextInputType.visiblePassword,
      labelText: "Confirmar senha",
      hintText: "******",
      icon: Icons.vpn_key_outlined,
    );
  }
}
