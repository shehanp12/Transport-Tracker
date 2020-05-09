import 'package:flutter/material.dart';
import 'package:flash_chat/screens/driver_screens/constants.dart';
import 'package:flash_chat/screens/driver_screens/welcome_screen.dart';

class BuildEmail extends StatefulWidget {
  @override
  _BuildEmailState createState() => _BuildEmailState();
}

class _BuildEmailState extends State<BuildEmail> {

  
  @override
  Widget build(BuildContext context) {

      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
            validator: (val)=>val.isEmpty?'Enter an email address':null,
                
                onChanged: (val) {
                 setState(() {
                   email = val;
                  });

              }
          ),
        ),
      ],
    );
    
      
    
  }
}