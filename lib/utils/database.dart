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




//transport list from snapshots
Future<List<Transport>> get transportListFromSnapshots async {
  var  transList = new List<Transport>();
  await transportCollection.snapshots().first.then((value){
    value.documents.forEach((doc){
      transList.add(Transport(
      arivalTime:doc.data['Arival time'] ?? '',
      departureTime:doc.data['Departure time'] ?? '',
      busName:doc.data['Bus Name'] ?? '',
      telephone:doc.data['Telephone Number'] ?? '',
    ));
    });
  });
  return transList;
}




   

}