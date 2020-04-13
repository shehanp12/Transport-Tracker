import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user.dart';


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

  Future<bool> signInWithEmail(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);
      FirebaseUser user = result.user;
      if(user != null)
      return true;
      else
      return false;
    } catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("error logging out");
    }
  }

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

  Future registerWithEmailAndPassword(String email, String password) async{
    try{
       AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
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

}