import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:bemol_canal/screens/init/widgets/forms/custom_textformfield.dart';

import 'package:bemol_canal/constants/screen_size.dart';
import 'package:bemol_canal/constants/colors.dart';
import 'package:bemol_canal/constants/font_size.dart';

class SignInScreen extends StatefulWidget {
  final ValueChanged<int> onComeBackButtonPressed;

  const SignInScreen({Key? key, required this.onComeBackButtonPressed})
      : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Screen.sizeWidth(context: context),
          height: Screen.sizeHeight(context: context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    _logo(),
                    _message(),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ConstColors.liteBlue,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(40),
                    topRight: Radius.circular(150),
                  ),
                ),
                width: Screen.sizeWidth(context: context),
                height: Screen.sizeHeight(context: context, dividedBy: 2.5),
                child: _login(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- FUNCTIONS
  void _handlerLoginButton() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Logar usuario
      _loginUser(email, password);
    }
  }

  void _loginUser(String email, String password) {
    final _authFire = FirebaseAuth.instance;

    _authFire
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sucesso ao logar!'),
      ));

      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }).catchError((onError) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Houve um erro, por favor, tente novamente.'),
      ));
    });
  }

  // --- WIDGETS
  Widget _logo() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: Screen.sizeWidth(
          context: context,
          multipliedBy: (Screen.ratio(context) < 9 / 16) ? 0.6 : 0.5),
      child: Image.asset("assets/images/logo_bemol.png"),
    );
  }

  Widget _message() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Bem vindo de volta!\nInsira seu ",
        style: TextStyle(
          color: Colors.black,
          fontSize: FontSize.headline,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "email",
            style: TextStyle(
              color: ConstColors.red,
            ),
          ),
          TextSpan(
            text: " e",
            style: TextStyle(
              color: ConstColors.black,
            ),
          ),
          TextSpan(
            text: " senha",
            style: TextStyle(
              color: ConstColors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _login() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _email(),
            _password(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _loginButton(),
                _goBackButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
      isLogin: true,
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
        } else if (value.length <= 7) {
          return 'Muito fraca';
        }
        return null;
      },
      isLogin: true,
      textInputType: TextInputType.visiblePassword,
      controller: _passwordController,
      labelText: "Senha",
      hintText: "******",
      icon: Icons.vpn_key,
    );
  }

  Widget _goBackButton() {
    return ElevatedButton(
      onPressed: () => widget.onComeBackButtonPressed(1),
      child: const Text("Voltar"),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () => _handlerLoginButton(),
      child: const Text('Continuar'),
    );
  }
}
