import 'package:flutter/material.dart';
import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/repository/user_repository.dart';
import 'package:flutter_lovers/services/auth_base.dart';

enum ViewState { Idle, Busy }

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  MyUser? _user;

  MyUser? get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<MyUser> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return user!;
    } catch (e) {
      print("Hata usermodel currentstate çıktı");
      throw Exception(e);
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
      print("Hata usermodel signInAnonymously çıktı ");
      throw Exception(e);
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      await _userRepository.signOut();
      _user = null;
      return true;
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
      print("Hata usermodel signInWithGoogle çıktı ");
      throw Exception(e);
    } finally {
      state = ViewState.Idle;
    }
  }
}
