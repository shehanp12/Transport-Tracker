import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/driver_screens/regform.dart';
import 'package:flash_chat/utils/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class MapDriver extends StatefulWidget {
  

  static const String id = 'driver_map_screen';

  MapDriver({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MapDriverState createState() => _MapDriverState();
}

class _MapDriverState extends State<MapDriver> {
  

  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;
  String uid;
  var name;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(6.8211, 80.0409),
    zoom: 14.4746,
  );
//6.8211, 80.0409
  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("images/car.png");
    return byteData.buffer.asUint8List();
  }

   Future<String> setname() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
     uid = user.uid.toString();

    DocumentReference documentReference =
                Firestore.instance.collection("transport").document(uid);
        documentReference.get().then((dataSnapshot){
          if(dataSnapshot.exists){
            print(dataSnapshot.data['Bus Name'].toString());
             name=dataSnapshot.data['Bus Name'].toString();
getCurrentLocation();
                       }
          else{
            print('loading');
          }
        });
return name;
  }

   final DatabaseReference database = FirebaseDatabase.instance.reference().child("drivertest");

   Future<String> inputData(LocationData newLocalData) async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
     uid = user.uid.toString();
    

              
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
          database.child(uid).set({
   "latitude":latlng.latitude,
   "longitude":latlng.longitude,
   "id":name,
   });
print(name);

  return uid;
  }





  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    print(uid);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
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

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 14.00)));
          updateMarkerAndCircle(newLocalData, imageData);
          inputData(newLocalData);
          
        }
      });
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

  final AuthProvider _auth = AuthProvider();
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
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.lock),
            label: Text('Logout',style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'times-new-roman',
                        ),),
          )
        ],
      ),
      drawer: Container(
        
      width: 195,
      child: Drawer(
        
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

           

            ListTile(
                leading: Icon(Icons.view_day),
                title: new Text("Create a shedule"),
                onTap: () {
                  Navigator.of(context).pushNamed(RegForm.id);}
                ), 

            ListTile(
                leading: Icon(Icons.lock),
                title: new Text("logout"),
                onTap: () async  { await _auth.signOut();
                  }
                ),
          ],
        ),
        
      ),
    ),
      body: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: true,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker] : []),
        circles: Set.of((circle != null) ? [circle] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        }
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            setname();
          }),
    );
  }
}
