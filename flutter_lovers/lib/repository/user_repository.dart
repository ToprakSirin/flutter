import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/services/auth_base.dart';
import 'package:flutter_lovers/services/fake_auth_service.dart';
import 'package:flutter_lovers/services/firebase_auth.service.dart';
import 'package:flutter_lovers/services/firestore_db_service.dart';

enum AppMode { DEBUG, RELASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthService _fakeAuthService = locator<FakeAuthService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();

  AppMode _appMode = AppMode.RELASE;

  @override
  Future<MyUser> currentUser() async {
    if (_appMode == AppMode.DEBUG) {
      return await _fakeAuthService.currentUser();
    } else {
      return await _firebaseAuthService.currentUser();
    }
  }

  @override
  Future<MyUser> signInAnonymously() async {
    if (_appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInAnonymously();
    } else {
      return await _firebaseAuthService.signInAnonymously();
    }
  }

  @override
  Future<bool> signOut() async {
    if (_appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<MyUser> signInWithGoogle() async {
    if (_appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInWithGoogle();
    } else {
      MyUser _user = await _firebaseAuthService.signInWithGoogle();
      bool _sonuc = await _firestoreDBService.saveUser(_user);
      if (_sonuc) {
        return await _firestoreDBService.readUser(_user.userID.toString());
        
      } else
        throw Exception();
    }
  }

  @override
  Future<MyUser> createUserWithEmailandPassword(
      String email, String sifre) async {
    if (_appMode == AppMode.DEBUG) {
      return await _fakeAuthService.createUserWithEmailandPassword(
          email, sifre);
    } else {
      MyUser _user = await _firebaseAuthService.createUserWithEmailandPassword(
          email, sifre);
      bool _sonuc = await _firestoreDBService.saveUser(_user);
      if (_sonuc) {
        return await _firestoreDBService.readUser(_user.userID.toString());
      } else
        throw Exception();
    }
  }

  @override
  Future<MyUser> signInWithEmailandPassword(String email, String sifre) async {
    if (_appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInWithEmailandPassword(email, sifre);
    } else {
      MyUser _user =
          await _firebaseAuthService.signInWithEmailandPassword(email, sifre);
      return await _firestoreDBService.readUser(_user.userID.toString());
    }
  }
}
