import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_lovers/model/user_model.dart';


abstract class DBBase {

  Future<bool> saveUser(MyUser user);
}
