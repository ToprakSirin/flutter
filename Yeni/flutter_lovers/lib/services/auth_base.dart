import 'package:flutter_lovers/model/user.dart';

abstract class AuthBase {
Future<MyUser> currentUser();
  Future<MyUser> signInAnonymously();
  Future<bool> signOut();
  Future<MyUser> signInWithGoogle();

  Future<MyUser?> signInWithEmailAndPassword(String email, String password);
  Future<MyUser?> createUserWithEmailAndPassword(String email, String password);
}
