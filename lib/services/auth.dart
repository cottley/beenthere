import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method for anonymous sign in for testing
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch(err) {
      print(err.toString());
      return null;
    }
  }

  // Method for sign in with email and password

  // Method for register with email and password

  // Method to sign out

}