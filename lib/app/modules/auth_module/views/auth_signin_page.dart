import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pipv3/app/modules/auth_module/stores/auth_login_store.dart';
import 'package:pipv3/app/view_components/button_component.dart';
import 'package:pipv3/app/view_components/text_field_component.dart';
import 'package:provider/provider.dart';

class AuthSignin extends StatefulWidget {
  @override
  _AuthSigninState createState() => _AuthSigninState();
}

class _AuthSigninState extends State<AuthSignin> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controllerLogin = Provider.of<AuthLoginStore>(context);
    //final snackBar = SnackBar(content: Text('Usuário ou Senha Inválidos'));
    var modal = Stack(
      children: [
        Opacity(
          opacity: 0.3,
          child: const ModalBarrier(
            dismissible: false,
            color: Colors.grey,
          ),
        ),
        Center(
          child: new CircularProgressIndicator(),
        ),
      ],
    );
    return Scaffold(
      body: Observer(
        builder: (context) => Stack(
          children: [
            Form(
                child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFieldComponent(
                      label: "Usuário",
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
                    Row(
                      children: [
                        FlatButton(
                            onPressed: () {},
                            child: Text(
                              "Esqueceu o usuário ou a senha?",
                              style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonComponent(
                      icon: Icon(Icons.lock_open),
                      action: () {
                        controllerLogin.signin(userController.text,
                            passwordController.text, context);
                      },
                      label: Text("Entrar"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonComponent(
                      icon: Icon(Icons.person_add),
                      action: () {},
                      label: Text("Não tem conta? Cadastre-se!"),
                    ),
                  ],
                ),
              ),
            )),
            controllerLogin.isloading ? modal : Stack(),
          ],
        ),
      ),
    );
  }
}
