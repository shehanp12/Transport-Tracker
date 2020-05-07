import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user.dart';
import './database.dart';


class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on  FirebaseUser
   User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
  //auth change user stream 
  Stream<User> get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user)) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  } 

//sign in with email and password
  Future  signInWithEmailAndPassword(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);
      FirebaseUser user = result.user;
      // await DatabaseService(uid: user.uid).updateUserData();
     return _userFromFirebaseUser(user);
    } catch (e) {
    print(e.toString());
    return null;
    }
  }

 // sign out 
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("error logging out");
    }
  }


// register with google signIn
  Future<bool> loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
       
      
      if(account == null )
        return false;
      AuthResult res = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: (await account.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));
      if(res.user == null)
        return false;
     
      return true;
    } catch (e) {
      print(e.message);
      print("Error logging with google");
      return false;
    }
  }
 //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
        await DatabaseService(uid: user.uid).updateUserData("12","34","Shehan","23334");
      return _userFromFirebaseUser(user);

    }
    catch(e){
      print(e.toString());
      return null;

    }
  }

  //signOut
  Future signOut() async {
    try{
      return await _auth.signOut();

    }
    catch(e){
      print(e.toString());
      return null;

    }
  }

  currentUser() {}

  

}