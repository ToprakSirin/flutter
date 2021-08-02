import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';

class FakeAuththenticationService implements AuthBase {
  @override
  Future<User> currentUser() {
   
    throw UnimplementedError();
  }

  @override
  Future<User> signInAnonymously() {

    throw UnimplementedError();
  }

  @override
  Future<User> signInWithGoogle() {
   
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    
    throw UnimplementedError();
  }
  
}