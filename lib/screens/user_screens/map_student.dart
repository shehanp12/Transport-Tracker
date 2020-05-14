import 'dart:async';
import 'dart:typed_data';
import 'package:firebase_database/firebase_database.dart';

import 'package:flash_chat/screens/user_screens/develop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flash_chat/widgets/createHeader.dart';
import 'package:flash_chat/screens/user_screens/card_student.dart'; 
import 'package:flash_chat/models/transport.dart';
import 'package:provider/provider.dart'; 
import 'package:flash_chat/utils/database.dart';

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
    ByteData byteData = await DefaultAssetBundle.of(context).load("images/car.png");
    return byteData.buffer.asUint8List();
  }



  Future<Set<void>> getLocation() async{
    var snapshot = await  FirebaseDatabase.instance.reference().child('drivertest').once();
    var res = snapshot.value.values as Iterable;
    var j=1;
    for ( var i in res){
    
      print(i);
      print(j);
      j++;
    }
  }
List<Marker> allmarkers=[];

  void updateMarkerAndCircle(id,markers,LocationData newLocalData, Uint8List imageData,lat,longi,markerid){




 print(lat );
 print(longi);
 print("test");

    LatLng location=  new LatLng(lat,longi);
markers.add(Marker(markerId:MarkerId('$markerid'),
position: location,
infoWindow: InfoWindow(
  title: id,
),
icon: BitmapDescriptor.fromBytes(imageData)
),

);

    this.setState(() {
      marker = Marker(
          markerId: MarkerId('$markerid'),
          position:location,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));



});
  }



  void getCurrentLocation() async {

    
    try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();




      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData) async {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
              tilt: 0,
              zoom: 9.00)));

    var snapshot = await  FirebaseDatabase.instance.reference().child('drivertest').once();
    var res = snapshot.value.values as Iterable;
    var markerid=1;
    for ( var i in res){
      print(i);
      print(markerid);
      updateMarkerAndCircle(i['id'],allmarkers,location, imageData,i['latitude'], i['longitude'],markerid);
          markerid++;
    }
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
   return StreamProvider<List<Transport>>.value(
      value:DatabaseService().transports,
          child: Scaffold(
      appBar: AppBar(
         title: Text("Buses",
         style: TextStyle(
                          
                          fontFamily: 'times-new-roman',
                          
                        ),),
         
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: <Widget>[
         
        ],
      ),

      drawer:Container(
        width: 195,
         child:Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
             width: 20.0,
            height: 30.0,
            ),
           CircleAvatar(
              radius: 70,
             backgroundColor: Colors.grey,   
            child:Image.asset('images/user.png',),),
            Divider(color: Colors.black, height: 20.0,),
            SizedBox(
             width: 20.0,
            height: 30.0,
            ),
          ListTile(
                leading: Icon(Icons.person),
                title: new Text("DevelopedBy",
                 style: TextStyle(
                          
                          fontFamily: 'times-new-roman',
                          
                        ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(DevelopedBy.id);
                  }
                ), 
            SizedBox(
             
            height: 10.0,
            ),
          ListTile(
                leading: Icon(Icons.view_day),
                title: new Text("Shedule",
                 style: TextStyle(
                          
                          fontFamily: 'times-new-roman',
                          
                        ), 
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(CardStudent.id);
                  }
                ),
          
            

        ],
      )
      ),
      ),
    
      body: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: true,
        initialCameraPosition: initialLocation,
        markers: Set.from(allmarkers),
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

          
    ),
   );
    
  }
}