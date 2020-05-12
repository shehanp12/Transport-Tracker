import 'package:flutter/material.dart';
import 'package:flash_chat/models/transport.dart'; 

class TransportTile extends StatelessWidget{
 
   final  Transport transport;
  TransportTile({this.transport});

 
 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child:Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child:ListTile(
          leading:CircleAvatar(
            radius:25,
            backgroundColor: Colors.white12,
            backgroundImage: AssetImage("images/bus.png"
            
            ),
            
            ),
          trailing:Text(transport.busName,style: TextStyle( fontFamily: 'times-new-roman'),),
          title:Text(transport.arivalTime,style: TextStyle( fontFamily: 'times-new-roman'),),
          /*  isThreeLine: true, */
           subtitle: Text(transport.departureTime,style: TextStyle( fontFamily: 'times-new-roman'),),     

        )
      )
    );
  }
}