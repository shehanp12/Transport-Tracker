import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flash_chat/widgets/createHeader.dart';
import 'package:flash_chat/screens/user_screens/card_student.dart'; 


class MyHomePage extends StatefulWidget {

   static const String id = 'map_student';



  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;
  final DatabaseReference database = FirebaseDatabase.instance.reference().child("drivertest");
var lat;
var longi;




  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(6.8211, 80.0409),
    zoom: 8.00,
  );
//6.8211, 80.0409
  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/images/car_icon.png");
    return byteData.buffer.asUint8List();
  }


  void getlatitude() async{
  
    
     lat=(await FirebaseDatabase.instance.reference().child('drivertest').child('driver2').child('latitude').once()).value;


return lat;

  
  /*
database.child("driver2").child("latitude").once().then((DataSnapshot dataSnapshot){
var lat=dataSnapshot.value;
print(lat);
});
database.child("driver2").child("longitude").once().then((DataSnapshot longitude){

var longi= longitude.value;
print(longi);
  
});
*/


}

void getlongitude() async{
   longi=(await FirebaseDatabase.instance.reference().child('drivertest').child('driver2').child('longitude').once()).value;

  return longi;
}

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData,lat,longi){




   print(lat);
  print(longi);



    LatLng location=  new LatLng(lat, longi);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position:location,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: location,
          fillColor: Colors.blue.withAlpha(70));

});
  }

    


  void getCurrentLocation() async {

    
    try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();
 
      updateMarkerAndCircle(location, imageData,lat,longi);
      


      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
              tilt: 0,
              zoom: 12.00)));
          updateMarkerAndCircle(location, imageData,lat,longi);
          getlatitude();
          getlongitude();
          
         
          
          
        }}
        
      );

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }    


  }


  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*  title: Text(widget.title),
         */
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: <Widget>[
         
        ],
      ),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width:100,
                    height:100,
                    margin:EdgeInsets.all(30),
                  /*   decoration: BoxDecoration(
                      shape: BoxShape.circle,
                     
                    ) */

                  ),
                ],
              ),
            ),
          ),
          CreateHeader(Icons.person, 'Developed By',()=>{
             Navigator.of(context).pushNamed(CardStudent.id)
          } ),
           CreateHeader(Icons.view_day, 'Shedule ',()=>{} ),     
        ],
      )),
    
      body: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: true,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker] : []),
        circles: Set.of((circle != null) ? [circle] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        
        

      ),
      
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            getCurrentLocation();
          }),

          
    );
    
  }
}