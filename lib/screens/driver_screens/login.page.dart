import 'package:flutter/material.dart';
import 'package:flash_chat/screens/widget/button.dart';
import 'package:flash_chat/screens/widget/first.dart';
import 'package:flash_chat/screens/widget/inputEmail.dart';
import 'package:flash_chat/screens/widget/password.dart';
import 'package:flash_chat/screens/widget/textLogin.dart';
import 'package:flash_chat/screens/widget/verticalText.dart';
import 'package:flash_chat/screens/widget/Gbutton.dart';
import 'package:flash_chat/utils/firebase_auth.dart';




class LoginPage extends StatefulWidget {
   static const String id = 'Loginpage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                InputEmail(),
                PasswordInput(),
                ButtonLogin(),
                FirstTime(),
                Gbutton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


