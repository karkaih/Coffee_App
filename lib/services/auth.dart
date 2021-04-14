import 'package:coffe_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user obj based on firebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid):null ;
  }
  //auth change the stream
  Stream<User> get user {

    return _auth.onAuthStateChanged.
    //map((FirebaseUser user)=> _userFromFirebaseUser(user))
    map(_userFromFirebaseUser);
  }
  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;

      // UserCredential result = await _auth.signInAnonymously();
      // User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in with email  & password

// register with email & password

//sign out

}