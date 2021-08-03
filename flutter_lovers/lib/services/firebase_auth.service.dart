import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_lovers/model/user_model.dart';

import 'package:flutter_lovers/services/auth_base.dart';


class FirebaseAuthService implements AuthBase {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<MyUser> currentUser() async {
    try {
      User _user = _firebaseAuth.currentUser!;
      return _useFromFirebase(_user);
    } catch (e) {
      print("Hata Current User: " + e.toString());
      throw Exception(e);
    }
  }

  MyUser _useFromFirebase(User user) {
    return MyUser( user.uid);
  }

  @override
  Future<MyUser> signInAnonymously() async {
    try {
      UserCredential sonuc = await _firebaseAuth.signInAnonymously();
      return _useFromFirebase(sonuc.user!);
    } catch (e) {
      print("Hata anonmyously: $e");
      throw Exception(e);
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("Hata sign out $e");
      return false;
    }
  }


  
  
  
}