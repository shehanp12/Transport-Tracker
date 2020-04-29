import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection reference 
  final CollectionReference transportCollection=Firestore.instance.collection('transport');

  Future updateUserData() async {
    return await transportCollection.document(uid).setData({
     
    });  
    
  }

}