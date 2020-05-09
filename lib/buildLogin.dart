import 'package:flutter/material.dart';
import 'package:flash_chat/utils/firebase_auth.dart';
import 'package:flash_chat/BuilEmail.dart';

class BuildLogin extends StatefulWidget {
  @override
  _BuildLoginState createState() => _BuildLoginState();
}

class _BuildLoginState extends State<BuildLogin> {
  final  _formKey=GlobalKey<FormState>();
     bool loading = false;
     final AuthProvider _auth= AuthProvider();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async{
                  
                  if(_formKey.currentState.validate()){
                    setState(() {
                      loading =true;
                    });
                   dynamic result=await  _auth.signInWithEmailAndPassword(email, password);
                   if(result ==null){
                       setState(() {
                      /* error='could not sign with email and password'; */
                      loading =false;
                    });
                     
                   /*  setState(()=>error='could not sign with email and password'); */
                   }

                 }
                },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}