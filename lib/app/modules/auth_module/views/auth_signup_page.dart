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
  final _formKey = GlobalKey<FormState>();

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
        key: _formKey,
        child: Observer(
            builder: (context) => controllerLogin.userAuthModel.token == null &&
                    controllerLogin.isloading == false
                ? Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFieldComponent(
                            validator: (value) {
                              if(value.toString().isEmpty)
                              {
                                return "Forneça um nome de usuário válido!";
                              }
                              if (controllerLogin.usernameCheck) {
                                return "Usuário já existe!";
                              }
                              return null;
                            },
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
                            validator: (value){
                              if(value.toString().isEmpty){
                                return "Forneça uma senha válida!";
                              }
                              if(value.toString().length < 7){
                                return "Senha deve possuir mais de 6 caracteres!";
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFieldComponent(
                            label: "Repita a Senha",
                            isHide: true,
                            controller: passwordRepeatController,
                            validator: (value){
                              if(value.toString().isEmpty){
                                return "Repita novamente a senha aqui!";
                              }
                              if(passwordController.text.isNotEmpty && passwordController.text != passwordRepeatController.text)
                              {
                                return "Senhas fornecidas não são iguais!";
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ButtonComponent(
                            icon: Icon(Icons.lock_open),
                            action: () async {
                              if(userController.text.isNotEmpty){
                                 var response = await controllerLogin.verifyUsername(userController.text);
                              }
                              if (_formKey.currentState.validate()) {
                                controllerLogin.signUp(userController.text,
                                    passwordController.text);
                              }
                            },
                            label: Text("Cadastrar"),
                          ),
                        ],
                      ),
                    ),
                  )
                : controllerLogin.userAuthModel.token == null &&
                        controllerLogin.isloading
                    ? Center(child: CircularProgressIndicator())
                    : Container()),
      ),
    );
  }
}
