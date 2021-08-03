import 'package:flutter_lovers/model/user_model.dart';

abstract class AuthBase {
  Future<MyUser> currentUser();
  Future<MyUser> signInAnonymously();
  Future<bool> signOut();
  Future<MyUser> signInWithGoogle();
  Future<MyUser> signInWithEmailandPassword(String email,String sifre);
  Future<MyUser> createUserWithEmailandPassword(String email,String sifre);
}
