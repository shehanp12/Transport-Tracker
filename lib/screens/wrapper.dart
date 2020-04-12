import 'package:flash_chat/models/user.dart';
import 'package:flash_chat/screens/driver_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/* import 'package:flash_chat/utils/firebase_auth.dart'; */


class Wrapper extends StatelessWidget {
   static const String id = 'wrapper';
  @override
  Widget build(BuildContext context) {

    //return either welcome screen or map
    final user=Provider.of<User>(context);
    print(user);

    return WelcomeScreen();
  }
}