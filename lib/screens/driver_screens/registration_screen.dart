import 'package:flutter/material.dart';
import '../../utils/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

   final AuthProvider _auth = AuthProvider();

   final  _formKey=GlobalKey<FormState>();

    //text field state
  String email ='';
  String password ='';
  String error ='';


 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up')
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
                  'Sign Up',
                  style:TextStyle(color:Colors.white),

                ),
                onPressed: () async{
                 if(_formKey.currentState.validate()){
                   dynamic result=await _auth.registerWithEmailAndPassword(email, password);
                   if(result ==null){
                    setState(()=>error='please supply a valid email anddress');
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
