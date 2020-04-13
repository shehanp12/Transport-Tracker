import 'package:flutter/material.dart';
import '../../utils/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthProvider _auth = AuthProvider();

  //text field state
  String email ='';
  String password ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Sign In')
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(onChanged: (val) {
                 setState(() {
                    email = val;
                  });

              }),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                 setState(() {
                   password=val;
                 });
                } 
              ),
                  SizedBox(height: 40),
              RaisedButton(
                color:Colors.blueAccent,
                child: Text(
                  'Sign In',
                  style:TextStyle(color:Colors.white),

                ),
                onPressed: () async{
                  print(email);
                  print(password);
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
