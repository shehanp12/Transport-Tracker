import 'package:firebase_database/firebase_database.dart';

class User {

  String _id;
  String _latitude;
  String _longitude;

  User(this._id,this._latitude,this._longitude);

  String get latitude => _latitude;

  String get longitude => _longitude;

  String get id => _id;

  User.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _latitude = snapshot.value['latitude'];
    _longitude = snapshot.value['longitude'];

  }
}
