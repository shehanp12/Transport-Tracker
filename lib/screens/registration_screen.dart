import 'package:flutter/material.dart';
import '../utils/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
 TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              Text("Sign up", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),),
              const SizedBox(height: 20.0),
              
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: "Enter email"
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter password"
                ),
              ),
              const SizedBox(height: 10.0),
              RaisedButton(
                child: Text("Sign up"),
                onPressed: ()async {
                  if(_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                    print("Email and password cannot be empty");
                    return;
                  }
                  bool res = await AuthProvider().registerWithEmailAndPassword(_emailController.text, _passwordController.text);
                  if(!res) {
                    print("Login failed");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
