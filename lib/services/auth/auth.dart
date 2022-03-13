import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ouniee/model/ouniee_staff_biodata_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //!CREATE USER OBJECT BASED ON FIREBASE USER.
  MyUser? _myUserFromFirebaseUser({User? user}) {
    return user != null
        ? MyUser(
            userId: user.uid,
            email: user.email,
          )
        : null;
  }

  //!AUTH CHANGE USER STREAM
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(
        (User? _firebaseUser) => _myUserFromFirebaseUser(user: _firebaseUser));
  }

  //! SIGN IN WITH EMAIL AND PASSWORD
  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? _user = result.user;
      return _myUserFromFirebaseUser(user: _user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //! REGISTER WITH EMAIL AND PASSWORD
  Future registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? _user = result.user;

      //!TODO - CREATE DATABASE SERVICE FUNCTION TO SAVE USER DATA
      //await DatabaseService(email: email).updateUserData();

      return _myUserFromFirebaseUser(user: _user);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        debugPrint("The provided password is weak !");
        return e.code;
      } else if (e.code == "email-already-in-use") {
        debugPrint("The account already exists");
        return e.code;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //! SIGN OUT
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
