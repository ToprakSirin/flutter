import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';

class FakeAuthService implements AuthBase {
  String userID = "123456";
  @override
  Future<MyUser> currentUser() async {
    return await Future.value(MyUser(userID));
  }

  @override
  Future<MyUser> signInAnonymously() async {
    return await Future.delayed(Duration(seconds: 2), () => MyUser(userID));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<MyUser> signInWithGoogle() {
    // TODO: implement SingletonFlutterWindowthGoogle
    throw UnimplementedError();
  }
}
