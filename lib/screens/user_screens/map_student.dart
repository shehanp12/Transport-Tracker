import 'dart:async';
import 'dart:typed_data';
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
  



  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(6.8211, 80.0409),
    zoom: 8.00,
  );
//6.8211, 80.0409
  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/images/car.png");
    return byteData.buffer.asUint8List();
  }
void readdate(){
  //driver2 want to 
database.child("driver2").child("latitude").once().then((DataSnapshot dataSnapshot){

DatabaseReference lat = dataSnapshot.value;
print(lat);
  
});
database.child("driver2").child("longitude").once().then((DataSnapshot longitude){

DatabaseReference longi= longitude.value;
 print(longi);
});
}


//



  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData,) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position:latlng,
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
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

    


  void getCurrentLocation() async {
    
    try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();
 
      updateMarkerAndCircle(location, imageData);
      


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
          updateMarkerAndCircle(newLocalData, imageData);
          readdate();
          
          
          
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
      backgroundColor: Colors.white,
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
