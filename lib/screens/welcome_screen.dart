import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../utils/firebase_auth.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                 
                  height: 60.0,
                ),
                Text(
                  'Driver Login',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
           
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () async {
                    
                     bool res = await AuthProvider().loginWithGoogle();
                  if(!res)
                    print("error logging in with google");
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Sign in with your google account',
                  ),
                )
              ),
            ),
           
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: ()   {
                     Navigator.pushNamed(context,RegistrationScreen.id);
                  
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Sign up with your email ',
                  ),
                )
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
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
            
           
          ],
        ),
        
      ),
    );
  }
}
