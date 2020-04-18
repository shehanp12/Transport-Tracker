import 'package:flutter/material.dart';
import '../screens/wrapper.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transport Tracker'), 
      ),
        body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           
             Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: (){
                     Navigator.of(context).pushNamed( Wrapper.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Driver ',
                  ),
                )
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: ()  {
                   
                    
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Student',
                  ),
                )
              ),
            ),
            
            
           
          ],
        ),
        
      ),
      
    );
  }
}