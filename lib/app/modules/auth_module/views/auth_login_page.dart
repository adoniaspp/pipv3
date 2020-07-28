import 'package:flutter/material.dart';
import 'package:pipv3/app/view_components/button_component.dart';
import 'package:pipv3/app/view_components/text_field_component.dart';

class AuthLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFieldComponent(
                  label: "Usuário",
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldComponent(
                  label: "Senha",
                  isHide: true,
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
                  action: () {},
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
        ),
      ),
    );
  }
}
