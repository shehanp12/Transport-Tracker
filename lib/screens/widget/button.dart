import 'package:flutter/material.dart';
import '../../utils/firebase_auth.dart';

class ButtonLogin extends StatefulWidget {
  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}


class _ButtonLoginState extends State<ButtonLogin> {
  
  final AuthProvider _auth = AuthProvider();
     final  _formKey=GlobalKey<FormState>();

  //text field state
  String email ='';
  String password ='';
  String error ='';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: () async {
            if(_formKey.currentState.validate()){
                   dynamic result=await  _auth.signInWithEmailAndPassword(email, password);
                   if(result ==null){
                    setState(()=>error='could not sign with email and password');
                   }

                 }
          },
          
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'OK',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.lightBlueAccent,
              ),
              SizedBox(height:12),
              Text(
                error,
                style:TextStyle(color:Colors.red,fontSize:14)
              ),
              
            ],
          ),
        ),
        
        
      ),
    );
  }
}
