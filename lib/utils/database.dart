import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/models/transport.dart';


class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference 
  final CollectionReference transportCollection=Firestore.instance.collection('transport');

  Future updateUserData(
    String arivalTime,
    String departureTime,
    String busName,
    String telephone,
    ) async {
    return await transportCollection.document(uid).setData({
     'Arival time':arivalTime,
     'Departure time':departureTime,
     'Bus Name':busName,
     'Telephone Number':telephone, 
    });  
 
  }

//get transport stream
Stream<List<Transport>> get transports{
  return transportCollection.snapshots().map(_transportListFromSnapshots); 
    
}

//transport list from snapshots
List<Transport> _transportListFromSnapshots(QuerySnapshot snapshot) {
  return snapshot.documents.map((doc){
    return Transport(
      arivalTime:doc.data['arivalTime'] ?? '',
      departureTime:doc.data['departureTime'] ?? '',
      busName:doc.data['busName'] ?? '',
      telephone:doc.data['telephone'] ?? '',


    );

  }).toList();
}




   

}