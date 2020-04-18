import 'package:flutter/material.dart';


class InputEmail extends StatefulWidget {
  @override
  _InputEmailState createState() => _InputEmailState();
}
String email ='';

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Form(
                  child: TextFormField(
            validator:(val)=> val.isEmpty ? 'Enter an email address':null ,

            onChanged: (val) {
                   setState(() {
                      email = val;
                    });

                },
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ),
      ),
    );
  }
}