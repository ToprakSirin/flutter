import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_lovers/model/user.dart';


abstract class DBBase {
Future<bool> saveUser(MyUser user);
  Future<MyUser> readUser(String userID);
  Future<bool> updateUserName(String userID, String yeniUserName);
  Future<bool> updateProfilFoto(String userId, String profilFotoURL);
  Future<List<MyUser>> getAllUserr();
}
