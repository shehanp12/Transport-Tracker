import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                   gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue[50], Colors.lightBlueAccent]
            
                  ),
                ),
        child: SpinKitFadingCircle(
        color: Colors.white, 
        size: 80),
      
    );
    
  
    
  }


}
