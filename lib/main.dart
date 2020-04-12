import 'package:flash_chat/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/driver_screens/welcome_screen.dart';
import 'package:flash_chat/screens/driver_screens/login_screen.dart';
import 'package:flash_chat/screens/driver_screens/registration_screen.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flash_chat/utils/firebase_auth.dart';
import 'package:flash_chat/screens/splash_screen.dart';
import 'package:flash_chat/models/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return StreamProvider<User>.value(
      value: AuthProvider().user,
      child: MaterialApp(
        
      /*  initialRoute: Wrapper.id , */ 
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Wrapper.id: (context) => Wrapper(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.green,
        textTheme: TextTheme(body1: TextStyle(color: Colors.purple)),
      ),
      home: Wrapper(),
      
    ),
      
      );
  }
}

/* class MainScreen extends StatelessWidget {
  //root of my application
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthProvider().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
} */
