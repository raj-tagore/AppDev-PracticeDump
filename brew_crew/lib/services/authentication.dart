// ignore_for_file: avoid_print

import 'package:brew_crew/models/customuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // object to use the class functions
  final FirebaseAuth _firebaseinstance = FirebaseAuth.instance;

  // sign in anonymously method
  Future signInAnonymously() async {
    try {
      UserCredential resultofsignin = await _firebaseinstance.signInAnonymously();
      User? userDetails = resultofsignin.user;
      CustomUser? customUser = _createCustomUser(userDetails);
      return customUser;
    } catch(e) {
      print(e.toString());
    }
  }

  // create user object based on firebase user
  CustomUser? _createCustomUser(User? user){
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  // the auth user stream
  Stream<CustomUser?> get userStream {
    return _firebaseinstance.authStateChanges()
      .map(_createCustomUser);
      //.map((User? user) => _createCustomUser(user),);
  }

  // sign out method
  Future signOut() async {
    try {
      return await _firebaseinstance.signOut();
    } catch(e) {
      print(e.toString());
    }
  }
}