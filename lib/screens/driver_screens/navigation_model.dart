
import 'package:flash_chat/utils/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/driver_screens/regform.dart';
final AuthProvider _auth = AuthProvider();

class NavigationModel {
  String title;
  IconData icon;
  Function onTap;

  NavigationModel({this.title, this.icon,this.onTap});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Shedule", icon: Icons.insert_chart,onTap: (){}  ),
  NavigationModel(title: "location", icon: Icons.edit_location,onTap: (){}),
  NavigationModel(title: "Search", icon: Icons.search),
 
  NavigationModel(title: "Log out", icon: Icons.lock,onTap: () async {
              await _auth.signOut();
            }, ),
];