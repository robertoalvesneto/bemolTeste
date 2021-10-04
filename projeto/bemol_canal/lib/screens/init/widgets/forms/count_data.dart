import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/screen_size.dart';

import 'package:bemol_canal/screens/init/widgets/top_container.dart';
import 'package:bemol_canal/screens/init/widgets/bottom_container.dart';
import 'package:bemol_canal/screens/init/widgets/forms/custom_textformfield.dart';

class CountDataForm extends StatefulWidget {
  final ValueChanged<int> onButtonPressed;

  const CountDataForm({
    Key? key,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  _CountDataFormState createState() {
    return _CountDataFormState();
  }
}

class _CountDataFormState extends State<CountDataForm> {
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
              titleName: "Dados da conta",
              callback: widget.onButtonPressed,
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
                      onPressed: () {
                        /*
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      */
                      },
                      child: const Text('Continuar'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 1,),
          ],
        ),
      ),
    );
  }
}

Widget _email() {
  return CustomTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    labelText: "Email",
    hintText: "joao123@gmail.com",
    icon: Icons.email,
  );
}

Widget _password() {
  return CustomTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    labelText: "Senha",
    hintText: "******",
    icon: Icons.vpn_key,
  );
}

Widget _confirmPassword() {
  return CustomTextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    labelText: "Confirmar senha",
    hintText: "******",
    icon: Icons.vpn_key_outlined,
  );
}
