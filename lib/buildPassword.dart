import 'package:flutter/material.dart';
import 'package:flash_chat/screens/driver_screens/constants.dart';
import 'package:flash_chat/screens/driver_screens/welcome_screen.dart';

class BuildPassword extends StatefulWidget {
  @override
  _BuildPasswordState createState() => _BuildPasswordState();
}

class _BuildPasswordState extends State<BuildPassword> {
  @override
  Widget build(BuildContext context) {
  
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
            validator: (val)=> val.length<6 ? 'Enter an password 6+ chars long ':null,
                onChanged: (val) {
                 setState(() {
                   password=val;
                 });
                } 
          ),
        ),
      ],
    );
  }
}