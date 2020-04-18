import 'package:flutter/material.dart';

class Gbutton extends StatefulWidget {
  @override
  _GbuttonNewUserState createState() => _GbuttonNewUserState();
}

class _GbuttonNewUserState extends State<Gbutton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 50, left: 120),
      child: Container(
        alignment: Alignment.bottomLeft,
        height: 25,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300],
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child:  FlatButton(
          onPressed: () {
            
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Log in with Google',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.email,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
