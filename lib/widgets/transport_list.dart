import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flash_chat/models/transport.dart';
import 'package:flash_chat/screens/user_screens/transport_tile.dart';

class TransportList extends StatefulWidget {
  @override
  _TransportListState createState() => _TransportListState();
}

class _TransportListState extends State<TransportList> {
  @override
  Widget build(BuildContext context) {

<<<<<<< HEAD
final transports = DatabaseService().transportListFromSnapshots;
final a=transports.toList();





=======
final transports =Provider.of<List<Transport>>(context);
>>>>>>> parent of 72862c9... wer
  // print(transports);
transports.forEach((transport){
  // print(transport);
  print(transport.departureTime);
  print(transport.busName);
  print(transport.telephone);


<<<<<<< HEAD
 })); 
=======

 }); 
 return Container();
>>>>>>> parent of 72862c9... wer

 
 /* return Container(); */
    return ListView.builder(   
      itemCount: a.length,
      itemBuilder:(context,index){
        return TransportTile(transport:a[index]);
      } 
    );
  }
}
