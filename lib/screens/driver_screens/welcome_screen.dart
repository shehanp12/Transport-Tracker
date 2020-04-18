<<<<<<< HEAD
import 'package:flash_chat/screens/driver_screens/LoginScreen.dart';
import 'package:flash_chat/screens/driver_screens/Registation_Screen.dart';
=======
>>>>>>> 4e421004da48d13ad3c3836dd4f374e8ef2917b6
import 'package:flutter/material.dart';

import '../../utils/firebase_auth.dart';
import 'registration_screen.dart'; 

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final AuthProvider _auth= AuthProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          /* crossAxisAlignment: CrossAxisAlignment.stretch, */
          children: <Widget>[
            RaisedButton(
                child: Text("Login with Google"),
                onPressed: () async {
                  bool res = await  _auth.loginWithGoogle();
                  if(!res)
                    print("error logging in with google");
                },
              ),
              Container(
                child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Sign in with google if you have a google account,'),
              subtitle: Text('If you havent register yet click Register button'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Register'),
                  onPressed: () {
                     Navigator.pushNamed(context,RegistrationScreen.id);
                  },
                ),
               
              ],
            ),
          ],
        ),
      ),
              ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: ()  {
                     Navigator.pushNamed(context, LoginScreen.id); 
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Sign In ',
                  ),
                )
              ),
            ),
            /*  Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: ()  {
                     Navigator.pushNamed(context,RegistrationScreen.id);
                    
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Sign Up ',
                  ),
                )
              ),
            ), */
            
            
           
          ],
        ),
        
      ),
      
    );
  }
}
