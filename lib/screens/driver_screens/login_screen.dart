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
      resizeToAvoidBottomInset: false,
      body: Container(
        
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue[50], Colors.lightBlueAccent]
            )
          ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key:_formKey,
          child: Column(
            children: <Widget>[
               Padding(padding: EdgeInsets.all(50.0)), 
              SizedBox(height: 20),
              TextFormField(
                decoration:  InputDecoration(
                        labelText: "Enter an email address",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                validator:(val)=> val.isEmpty ? 'Enter an email address':null,
                
                onChanged: (val) {
                 setState(() {
                    email = val;
                  });

              }),
              SizedBox(height: 20),
              TextFormField(
                decoration:  InputDecoration(
                        labelText: "Enter password",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
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
          color: Colors.white38,
          borderRadius: BorderRadius.circular(30),
      
               ),
             child: Container(
              constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
              alignment: Alignment.center,
              child: const Text(
                  'Sign In',
              textAlign: TextAlign.center,
                    ),
                   ),
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
