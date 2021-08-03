import 'package:flutter/foundation.dart';
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

  @override
  Future<MyUser> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return _user!;
    } catch (e) {
      debugPrint("ViewModeldeki curret user hata:" + e.toString());
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
       return _user!;
    } catch (e) {
      debugPrint("ViewModeldeki signInAnonymously hata:" + e.toString());
      return null!;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      return await _userRepository.signOut();
    } catch (e) {
      debugPrint("ViewModeldeki curret user hata:" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }
}
