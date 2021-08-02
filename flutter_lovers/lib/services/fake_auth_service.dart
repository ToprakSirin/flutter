import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';

class FakeAuththenticationService implements AuthBase {
  String userID = "121212";
  @override
  Future<MyUser> currentUser() async {
    return await Future.value(MyUser(userID));
  }
  

  @override
  Future<MyUser> signInAnonymously() async {
      return await Future.delayed(
        Duration(seconds: 1), () => MyUser(userID));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }
}
