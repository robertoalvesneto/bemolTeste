import 'package:flutter/material.dart';

import 'package:bemol_canal/constants/screen_size.dart';

import 'package:bemol_canal/screens/init/widgets/top_container.dart';
import 'package:bemol_canal/screens/init/widgets/bottom_container.dart';
import 'package:bemol_canal/screens/init/widgets/forms/custom_textformfield.dart';

class AdressDataForm extends StatefulWidget {
  final ValueChanged<int> onButtonPressed;

  const AdressDataForm({
    Key? key,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  _AdressDataFormState createState() {
    return _AdressDataFormState();
  }
}

class _AdressDataFormState extends State<AdressDataForm> {
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
              titleName: "Endereço",
              callback: widget.onButtonPressed,
              index: 0,
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
                      ElevatedButton(
                        onPressed: () {
                          /*
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      */
                          widget.onButtonPressed(0);
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