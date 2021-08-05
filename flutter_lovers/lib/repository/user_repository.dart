import 'dart:io';

import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/model/mesaj.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/services/auth_base.dart';
import 'package:flutter_lovers/services/fake_auth_service.dart';
import 'package:flutter_lovers/services/firebase_auth.service.dart';
import 'package:flutter_lovers/services/firebase_storage_service.dart';
import 'package:flutter_lovers/services/firestore_db_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthService _fakeAuthService = locator<FakeAuthService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();
  FirebaseStorageService _firebaseStorageService =
      locator<FirebaseStorageService>();

  AppMode _appMode = AppMode.RELEASE;

  List<MyUser> _allUsers = [];
  @override
  Future<MyUser> currentUser() async {
    if (_appMode == AppMode.DEBUG) {
      return await _fakeAuthService.currentUser();
    } else {
      MyUser _user = await _firebaseAuthService.currentUser();
      return await _firestoreDBService.readUser(_user.userID.toString());
    }
  }

  @override
  Future<MyUser> signInAnonymously() async {
    if (_appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInAnonymously();
    } else {
      MyUser _user = await _firebaseAuthService.signInAnonymously();
      bool result = await _firestoreDBService.saveUser(_user);
      if (result) {
        return _user;
      } else {
        throw Exception();
      }
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
      bool result = await _firestoreDBService.saveUser(_user);
      if (result) {
        return await _firestoreDBService.readUser(_user.userID.toString());
      } else {
        throw Exception();
      }
    }
  }

  @override
  Future<MyUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    if (_appMode == AppMode.DEBUG) {
      return await _fakeAuthService.createUserWithEmailAndPassword(
          email, password);
    } else {
      MyUser _user = await _firebaseAuthService.createUserWithEmailAndPassword(
          email, password);
      bool result = await _firestoreDBService.saveUser(_user);
      if (result) {
        return await _firestoreDBService.readUser(_user.userID.toString());
      }
    }
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(
      String email, String password) async {
    if (_appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInWithEmailAndPassword(email, password);
    } else {
      MyUser _user = await _firebaseAuthService.signInWithEmailAndPassword(
          email, password);
      return await _firestoreDBService.readUser(_user.userID.toString());
    }
  }

  Future<bool> updateUserName(String userID, String yeniUserName) async {
    if (_appMode == AppMode.DEBUG) {
      return false;
    } else {
      bool sonuc =
          await _firestoreDBService.updateUserName(userID, yeniUserName);
      return sonuc;
    }
  }

  Future<String> uploadFile(String? userID, String fileType, profilFoto) async {
    if (_appMode == AppMode.DEBUG) {
      return "Dosya indirme linki";
    } else {
      var profilFotoUrl = await _firebaseStorageService.uploadFile(
          userID!, fileType, profilFoto);
      await _firestoreDBService.updateProfilFoto(userID, profilFotoUrl);
      return profilFotoUrl;
    }
  }

  Future<List<MyUser>> getAllUser() async {
    if (_appMode == AppMode.DEBUG) {
      return [];
    } else {
      var tumKullaniciListesi = await _firestoreDBService.getAllUserr();
      return tumKullaniciListesi;
    }
  }

  Stream<List<Mesaj>> getMessages(
      String currentUserID, String sohbetEdilenUserID) {
    if (_appMode == AppMode.DEBUG) {
      return Stream.empty();
    } else {
      return _firestoreDBService.getMessages(currentUserID, sohbetEdilenUserID);
    }
  }
}
