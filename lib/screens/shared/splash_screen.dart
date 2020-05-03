
import 'file:///F:/ionic_android/flutter_transport_android/flutter_transport_android/lib/screens/shared/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

     @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ));
  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        fit:StackFit.expand,
        
        children:<Widget>[
          Container(
            decoration:BoxDecoration(
              color: new Color(0xff622F74),
              gradient: LinearGradient(
                colors:[Colors.blue[50],Colors.lightBlueAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                ),
            ),
          ),
          
          Column(  
            mainAxisAlignment:MainAxisAlignment.center,
            children:<Widget>[
              
              Image.asset('images/schbus.png',
              width: 150,
              ),  
              Padding(
                padding:EdgeInsets.only(top:20.0), 
              ),
              
              SizedBox(
                width: 250.0,
                child:Center(
                child: ColorizeAnimatedTextKit(
                  text: ["My  Bus",],
                  
                  textStyle: TextStyle(
                  fontSize: 50.0, 
                  fontFamily: "Horizon",
                  fontWeight:FontWeight.bold,
                  ),
                  colors: [
                  Colors.blue,
                  Colors.black,
                  Colors.blue,
                  Colors.white,
                    ],
                  ),
                ),
              ),
            ]
          )
        ],
      ),
      
    );
  }
  
}
