import 'package:flutter/material.dart';
import '../../utils/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthProvider _auth = AuthProvider();
     final  _formKey=GlobalKey<FormState>();

  //text field state
  String email ='';
  String password ='';
  String error ='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Sign In')
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key:_formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                validator:(val)=> val.isEmpty ? 'Enter an email address':null,
                
                onChanged: (val) {
                 setState(() {
                    email = val;
                  });

              }),
              SizedBox(height: 20),
              TextFormField(
                 validator:(val)=> val.length<6 ? 'Enter an password 6+ chars long ':null,
                
                obscureText: true,
                onChanged: (val) {
                 setState(() {
                   password=val;
                 });
                } 
              ),
                  SizedBox(height: 40),
              RaisedButton(
                color:Colors.blueAccent,
                child: Text(
                  'Sign In',
                  style:TextStyle(color:Colors.white),

                ),
                onPressed: () async{
                  
                  if(_formKey.currentState.validate()){
                   dynamic result=await  _auth.signInWithEmailAndPassword(email, password);
                   if(result ==null){
                    setState(()=>error='could not sign with email and password');
                   }

                 }
                }
              ),
               SizedBox(height:12),
              Text(
                error,
                style:TextStyle(color:Colors.red,fontSize:14)
              )

            ],
          ),
        ),
      ),
    );
  }
}
