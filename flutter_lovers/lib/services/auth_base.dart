import 'package:flutter_lovers/model/user_model.dart';

abstract class AuthBase {
  Future<MyUser> currentUser();
  Future<MyUser> signInAnonymously();
  Future<bool> signOut();

}
