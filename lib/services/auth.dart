import 'package:beenthere/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create been there user object based on firebase user object

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Listen to stream of FirebaseUser objects and convert to Been There Users
  Stream<User> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // Method for anonymous sign in for testing
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(err) {
      print(err.toString());
      return null;
    }
  }

  // Method for sign in with email and password

  // Method for register with email and password

  // Method to sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      return null;
    }
  }
}