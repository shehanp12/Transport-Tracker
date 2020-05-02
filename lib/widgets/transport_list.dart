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

final transports =Provider.of<List<Transport>>(context);
  // print(transports);
transports.forEach((transport){
  // print(transport);
  print(transport.departureTime);
  print(transport.busName);
  // print(transport.telephone);



 }); 
 return Container();

    /* return ListView.builder(
      itemCount: transports.length,
      itemBuilder:(context,index){
        return TransportTile();

      } ,


      
    ); */
  }
}
