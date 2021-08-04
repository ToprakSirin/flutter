import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';

class FakeAuthService implements AuthBase {
  String userID = "123456";
  @override
  Future<MyUser> currentUser() async {
    return await Future.value(
      MyUser(userID: userID, email: "fakeuser@fake.com"),
    );
  }

  @override
  Future<MyUser> signInAnonymously() async {
    return await Future.delayed(Duration(seconds: 2),
        () => MyUser(userID: userID, email: "fakeuser@fake.com"));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<MyUser> signInWithGoogle() async {
    return await Future.delayed(
        Duration(seconds: 2),
        () => MyUser(
            userID: "google_user_id.123456", email: "fakeuser@fake.com"));
  }

  @override
  Future<MyUser> createUserWithEmailandPassword(
      String email, String password) async {
    return await Future.delayed(
        Duration(seconds: 2),
        () => MyUser(
            userID: "created_user_id_123456", email: "fakeuser@fake.com"));
  }

  @override
  Future<MyUser> signInWithEmailandPassword(
      String email, String password) async {
    return await Future.delayed(
        Duration(seconds: 2),
        () => MyUser(
            userID: "sign_in_email_password_user_id_123456",
            email: "fakeuser@fake.com"));
  }
}
