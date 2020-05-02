import 'package:flutter/material.dart';
import 'package:flash_chat/utils/database.dart';
import 'package:provider/provider.dart'; 
import 'package:flash_chat/widgets/transport_list.dart';
import 'package:flash_chat/models/transport.dart';


class CardStudent extends StatefulWidget {
  static const String id = 'Card_Student';
  @override
  _CardStudentState createState() => _CardStudentState();
}

class _CardStudentState extends State<CardStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

         appBar: AppBar(
          title: Text('Shedule')
        ),
        body: TransportList()
    );
  }
}