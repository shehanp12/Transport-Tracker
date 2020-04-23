import 'package:flutter/material.dart';


class RegForm extends StatefulWidget {
  static const String id = 'Reg_Form';
  @override
  _RegFormState createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue[50], Colors.lightBlueAccent]
            )
          ),
        child: Form(
          child:Center(
            child: Column(
              children: <Widget>[
                 Padding(padding: EdgeInsets.all(10.0)),
                Text(
                  'Shedule Register',
                  style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  ),
                ),
                //field*1
                Padding(padding: EdgeInsets.only(top: 20.0)),
                 TextField(
                      decoration:  InputDecoration(
                        labelText: "Enter Arival Time",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      /* validator: (val) {
                        if(val.length==0) {
                          return "box cannot be empty";
                        }else{
                          return null;
                        }
                      } */
                    ),
                Padding(padding: EdgeInsets.all(10.0)),
                 TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Enter Depature Time",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "box cannot be empty";
                        }else{
                          return null;
                        }
                      },
                    ),
                   Padding(padding: EdgeInsets.all(10.0)),
                 TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Enter Bus Name",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "box cannot be empty";
                        }else{
                          return null;
                        }
                      },
                    ),
                 Padding(padding: EdgeInsets.all(10.0)),
                 TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Enter bus ",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "box cannot be empty";
                        }else{
                          return null;
                        }
                      },
                    ), 
                Padding(padding: EdgeInsets.only(top: 10.0)),
                 TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Enter Telephone number",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return "box cannot be empty";
                        }else{
                          return null;
                        }
                      },
                    ),    
                  Padding(padding: EdgeInsets.only(top: 10.0)),  
                 RaisedButton(
                  onPressed: () {

                   },
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
                  'OK',
              textAlign: TextAlign.center,
                    ),
                   ),
                  ),
                )     
              ]
            ),
          )
        ),
      ),
    );
  }
} 