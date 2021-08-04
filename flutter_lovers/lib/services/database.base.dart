import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_lovers/model/user.dart';


abstract class DBBase {

  Future<bool> saveUser(MyUser user);
   Future<MyUser> readUser(String userID);
}
