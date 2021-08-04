import 'package:flutter/material.dart';
import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/repository/user_repository.dart';
import 'package:flutter_lovers/services/auth_base.dart';

enum ViewState { Idle, Busy }

class UserViewModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  MyUser? _user;

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
      _user = await _userRepository.currentUser();
      if (_user != null)
        return _user!;
      else
        throw Exception();
    } catch (e) {
      debugPrint("Viewmodeldeki current user hata:" + e.toString());
      return null!;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser> signInAnonymously() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInAnonymously();
      return user!;
    } catch (e) {
      debugPrint("Viewmodeldeki current user hata:" + e.toString());
      throw Exception();
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      bool sonuc = await _userRepository.signOut();
      _user = null;
      return sonuc;
    } catch (e) {
      print("Hata usermodel sign out çıktı");
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithGoogle();
      return user!;
    } catch (e) {
      print("Hata userViewmodel signin google");
      throw Exception(e);
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<MyUser> createUserWithEmailandPassword(
      String email, String sifre) async {
    if (_emailSifreKontrol(email, sifre)) {
      try {
        state = ViewState.Busy;
        _user =
            await _userRepository.createUserWithEmailandPassword(email, sifre);

        return _user!;
      } finally {
        state = ViewState.Idle;
      }
    } else
      return null!;
  }

  @override
  Future<MyUser> signInWithEmailandPassword(String email, String sifre) async {
    try {
      if (_emailSifreKontrol(email, sifre)) {
        state = ViewState.Busy;
        _user = await _userRepository.signInWithEmailandPassword(email, sifre);
        return _user!;
      } else
        throw Exception();
    } finally {
      state = ViewState.Idle;
    }
  }

  bool _emailSifreKontrol(String email, String sifre) {
    var sonuc = true;
    if (sifre.length < 6) {
      passwordErrorMessage = "En az 6 karakter olmalı";
      sonuc = false;
    } else
      passwordErrorMessage = null;
    if (!email.contains('@')) {
      emailErrorMessage = "Geçersiz mail adresi";
      sonuc = false;
    } else
      emailErrorMessage = null;
    return sonuc;
  }
}
