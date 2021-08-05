import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/repository/user_repository.dart';


enum ViewState { Idle, Busy }

class UserViewModel with ChangeNotifier implements UserRepository {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepostory = locator<UserRepository>();
  MyUser? _user;

  //validate form login
  String? emailErrorMessage;
  String? passwordErrorMessage;

  MyUser? get user => _user;

  ViewState get state => _state;
  UserViewModel() {
    currentUser();
  }

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<MyUser> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepostory.currentUser();
      return user!;
    } catch (e) {
      print("Hata userViewmodel currentstate");
      throw Exception(e);
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser> signInAnonymously() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepostory.signInAnonymously();
      return user!;
    } catch (e) {
      print("Hata userViewmodel signin anon");
      throw Exception(e);
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;

      await _userRepostory.signOut();
      _user = null;

      return true;
    } catch (e) {
      print("Hata userViewmodel sign out");
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepostory.signInWithGoogle();
      return user!;
    } catch (e) {
      print("Hata userViewmodel signin google");
      throw Exception(e);
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    if (_emailAndPasswordValidate(email, password)) {
      try {
        state = ViewState.Busy;
        _user = await _userRepostory.createUserWithEmailAndPassword(
            email, password);
        return user!;
      } finally {
        state = ViewState.Idle;
      }
    }
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      if (_emailAndPasswordValidate(email, password)) {
        state = ViewState.Busy;
        _user =
            await _userRepostory.signInWithEmailAndPassword(email, password);
        return user!;
      }
    } finally {
      state = ViewState.Idle;
    }
  }

  bool _emailAndPasswordValidate(String email, String password) {
    bool sonuc = true;

    if (password.length < 6) {
      passwordErrorMessage = "Sifre en az 6 karakter olmalıdır";
      sonuc = false;
    } else {
      passwordErrorMessage = null;
    }
    if (!email.contains("@")) {
      emailErrorMessage = "hatali email";
      sonuc = false;
    } else {
      emailErrorMessage = null;
    }
    return sonuc;
  }

  Future<bool> updateUserName(String userID, String yeniUserName) async {
    bool sonuc = await _userRepostory.updateUserName(userID, yeniUserName);

    return sonuc;
  }

  Future<String> uploadFile(String? userID, String fileType, profilFoto) async {
    String indirmeLinki =
        await _userRepostory.uploadFile(userID, fileType, profilFoto);
    return indirmeLinki;
  }


   Future<List<MyUser>> getAllUser() async {
    List<MyUser> allUsers = await _userRepostory.getAllUser();
    return allUsers;
  }

}
