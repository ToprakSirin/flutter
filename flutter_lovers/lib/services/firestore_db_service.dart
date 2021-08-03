import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/database.base.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firebaseAuth = FirebaseFirestore.instance;
  @override
  Future<bool> saveUser(MyUser user) async {
    await _firebaseAuth.collection("users").doc(user.userID).set(user.toMap());
    return true;
  }
}
