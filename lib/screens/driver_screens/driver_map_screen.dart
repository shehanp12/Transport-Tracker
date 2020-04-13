import 'package:flash_chat/utils/firebase_auth.dart';
import 'package:flutter/material.dart';

class MapDriver extends StatefulWidget {
  @override
  _MapDriverState createState() => _MapDriverState();
}

class _MapDriverState extends State<MapDriver> {

  final AuthProvider _auth =AuthProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Map"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(onPressed:() async{
            await _auth.signOut();
          },
           icon: Icon(Icons.person), 
           label: Text('logOut'),
           )
        ],
      ),
    );
  }
}
