import 'package:flash_chat/models/user.dart';
import 'package:flash_chat/screens/driver_screens/driver_map_screen.dart';
import 'package:flash_chat/screens/driver_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
   static const String id = 'wrapper';
  @override
  Widget build(BuildContext context) {

    //return either welcome screen or map
    final user=Provider.of<User>(context);
    print(user);
  
    
     if(user== null){
       return WelcomeScreen(); 
     
    }
    else{
      return MapDriver();
     
    }  

    
  }
}