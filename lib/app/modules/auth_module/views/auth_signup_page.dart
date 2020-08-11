import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pipv3/app/modules/auth_module/stores/auth_login_store.dart';
import 'package:pipv3/app/view_components/button_component.dart';
import 'package:pipv3/app/view_components/text_field_component.dart';
import 'package:provider/provider.dart';

class AuthSignup extends StatefulWidget {
  @override
  _AuthSignupState createState() => _AuthSignupState();
}

class _AuthSignupState extends State<AuthSignup> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controllerLogin = Provider.of<AuthLoginStore>(context);

    return Scaffold(
      body: Form(
        child: Observer(
          builder: (context) => controllerLogin.userAuthModel.token == null && controllerLogin.isloading == false ?
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFieldComponent(
                    label: "Nome de Usuário",
                    controller: userController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldComponent(
                    label: "Senha",
                    isHide: true,
                    controller: passwordController,
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  TextFieldComponent(
                    label: "Repita a Senha",
                    isHide: true,
                    controller: passwordRepeatController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonComponent(
                    icon: Icon(Icons.lock_open),
                    action: () {
                      controllerLogin.signUp(userController.text, passwordController.text);
                    },
                    label: Text("Cadastrar"),
                  ),
                ],
              ),
            ),
          ) :  controllerLogin.userAuthModel.token == null && controllerLogin.isloading ?
          Center(child: CircularProgressIndicator()) :
          Container()
        ),
      ),
    );
  }
}