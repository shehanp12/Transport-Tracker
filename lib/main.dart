import 'package:flutter/material.dart';
import 'package:flash_chat/screens/driver_screens/welcome_screen.dart';
import 'package:flash_chat/screens/driver_screens/login_screen.dart';
import 'package:flash_chat/screens/driver_screens/registration_screen.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flash_chat/utils/firebase_auth.dart';
import 'package:flash_chat/screens/splash_screen.dart';



void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute:  WelcomeScreen.id,
       routes: {
         HomeScreen.id: (context) => HomeScreen(),
         SplashScreen.id: (context) => SplashScreen(),         
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
         RegistrationScreen.id: (context) => RegistrationScreen()
       },
      theme: ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.green,
    textTheme: TextTheme(body1: TextStyle(color: Colors.purple)),
  ),
  home:MainScreen(),
    );
    
  }
}
      
      
  
    
  


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*  return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return  SplashScreen();
        if(!snapshot.hasData || snapshot.data == null)
          return LoginScreen();
        return  HomeScreen();
      },
    ); */
  }
}
