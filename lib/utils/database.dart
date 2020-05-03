import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/models/transport.dart';


class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference 
  final CollectionReference transportCollection=Firestore.instance.collection('transport');

  Future<void> updateUserData(
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


//transport list from snapshots
List<Transport> _transportListFromSnapshots(QuerySnapshot snapshot) {
  return snapshot.documents.map((doc){
    return Transport(
      arivalTime:doc.data['Arival time'] ?? '',
      departureTime:doc.data['Departure time'] ?? '',
      busName:doc.data['Bus Name'] ?? '',
      telephone:doc.data['Telephone Number'] ?? '',


    );

  }).toList();

  
}

Stream<List<Transport>> get transports{
  return transportCollection.snapshots().map(_transportListFromSnapshots); 
    
}




   

}