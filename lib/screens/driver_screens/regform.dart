import 'package:flash_chat/screens/shared/loading_screen.dart';
import 'package:flash_chat/utils/database.dart';
import 'package:flash_chat/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextEditingController arivalInputController;

class RegForm extends StatefulWidget {
  static const String id = 'Reg_Form';
  @override
  _RegFormState createState() => _RegFormState();
}




class _RegFormState extends State<RegForm> {
  final _formKey = GlobalKey<FormState>();

  String _currentarivalTime;
  String _departarivalTime;
  String _currentbusName;
  String _currenttelephone;
  
  
  @override
  Widget build(BuildContext context){

     User user = Provider.of<User>(context)  ;

     return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return Form(
            key:_formKey,
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
                 TextFormField(
                   initialValue: userData.busName,
                    validator: (val) => val.isEmpty ? 'Please enter a busName' : null,
                  onChanged: (val) => setState(() => _currentbusName = val),
      
                      decoration:  InputDecoration(
                        labelText: "Enter Your Bus Name?",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      
                    ),
                      SizedBox(height: 10.0),
                Padding(padding: EdgeInsets.all(10.0)),
                 TextFormField(
                   initialValue: userData.arivalTime,
                      decoration:  InputDecoration(
                        labelText: "Enter Your Arival Time?",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentarivalTime = val),
                      
                    ),
                   Padding(padding: EdgeInsets.all(10.0)),
                 TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Enter Your Depature Time?",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                       validator: (val) => val.isEmpty ? 'Please enter your departure Time?' : null,
                  onChanged: (val) => setState(() => _departarivalTime = val),
                     
                    ),
                 Padding(padding: EdgeInsets.all(10.0)),
                 TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Enter Your Telephone Number",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                       validator: (val) => val.isEmpty ? 'Please enter your telephone number?' : null,
                  onChanged: (val) => setState(() =>_currenttelephone  = val),
                    
                    ), 
                Padding(padding: EdgeInsets.only(top: 10.0)),
            
                  Padding(padding: EdgeInsets.only(top: 10.0)),  
                 RaisedButton(
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentarivalTime ?? snapshot.data.arivalTime, 
                        _departarivalTime ?? snapshot.data.departureTime, 
                        _currentbusName ?? snapshot.data.busName, 
                        _currenttelephone ?? snapshot.data.telephone
                      );
                      Navigator.pop(context);
                    }
                  }
          )
              ])));
        }
     
      }
     );
  }
}
            
  


         


        
     
      

      
  

      
    

