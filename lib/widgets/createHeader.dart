import 'package:flutter/material.dart';


class CreateHeader extends StatelessWidget {

final IconData icon;
final String text;
final  Function onTap;
CreateHeader(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child:Container(
      decoration:BoxDecoration(border:Border(bottom:BorderSide(color:Colors.grey.shade400))),
          child: InkWell(
        splashColor: Colors.blue,
        onTap:onTap,
        child:Container(
          height:80,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(padding: const EdgeInsets.all(8),
                  child:Text(text, style:TextStyle(fontSize: 16),),
                 )
                ]
              ),
              Icon(Icons.arrow_right)
            ],

          )
        )

      ),
    )
    );

   
  
}

    
      
    
  }
