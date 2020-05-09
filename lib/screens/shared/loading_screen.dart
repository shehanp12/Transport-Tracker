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

  /*void initState() {
    
    startTime();
  }*/

  /*startTime() async {
  var duration = new Duration(seconds: 6);
  return new Timer(duration, route);
  }*/

/*route() {
  Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => AuthenticationScreen()
    )
  ); 
}*/

}
