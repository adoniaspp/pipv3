import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pipv3/app/view_components/button_component.dart';

class AuthHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SignInButton(
                Buttons.Email,
                text: "Entre com seu e-mail",
                padding:
                    EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
              ),
              SizedBox(
                height: 20,
              ),
              SignInButton(
                Buttons.Facebook,
                text: "Entre com facebook",
                padding:
                    EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              SignInButton(
                Buttons.Google,
                text: "Entre com google",
                padding:
                    EdgeInsets.only(right: 40, left: 40, top: 3, bottom: 3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              SignInButton(
                Buttons.Twitter,
                text: "Entre com twitter",
                padding:
                    EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              ButtonComponent(
                icon: Icon(Icons.lock_open),
                action: () {
                  Navigator.pushNamed(context, "/signup");
                },
                label: Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
