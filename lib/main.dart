import 'package:flash_chat/screens/driver_screens/login_screen.dart';
import 'package:flash_chat/screens/driver_screens/regform.dart';
import 'package:flash_chat/screens/driver_screens/welcome_screen.dart';
import 'package:flash_chat/screens/driver_screens/driver_map_screen.dart';
import 'package:flash_chat/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/driver_screens/registration_screen.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flash_chat/utils/firebase_auth.dart';
import 'package:flash_chat/screens/splash_screen.dart';
import 'package:flash_chat/models/user.dart';
import 'package:provider/provider.dart';
 import 'package:flash_chat/screens/user_screens/map_student.dart'; 


void main() => runApp(FlashChat1());

class FlashChat1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return StreamProvider<User>.value(
      value: AuthProvider().user,
      child: MaterialApp(
        
      /*  initialRoute: Wrapper.id , */ 
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        WelcomeScreen.id: (context) =>WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        MapDriver.id: (context) =>  MapDriver(),
        Wrapper.id: (context) => Wrapper(),
        RegForm.id: (context) => RegForm(),
       MyHomePage.id: (context) => MyHomePage(), 

      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.green,
        textTheme: TextTheme(body1: TextStyle(color: Colors.purple)),
      ),
      home:HomeScreen(),
      
      
    ),
      
      );
  }
}


