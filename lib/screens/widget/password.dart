import 'package:flutter/material.dart';


class PasswordInput extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

String password ='';

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Form(
                  child: TextFormField(
            validator: (val)=> val.length<6 ? 'Enter an password 6+ chars long ':null,
             obscureText: true, 
              onChanged: (val){
                setState(() {
                  password=val;
                });
              },
            

            style: TextStyle(
              color: Colors.white,
            ),
            
            
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Password',
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