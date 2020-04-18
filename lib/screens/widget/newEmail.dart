import 'package:flutter/material.dart';

class NewEmail extends StatefulWidget {
  @override
  _NewEmailState createState() => _NewEmailState();
}
String email ='';
class _NewEmailState extends State<NewEmail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
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
            labelText: 'E-mail',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}