import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/services/database.base.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firebaseDB = FirebaseFirestore.instance;
  @override
  Future<bool> saveUser(MyUser user) async {
    await _firebaseDB.collection("users").doc(user.userID).set(user.toMap());
    DocumentSnapshot _okunanUser =
        await FirebaseFirestore.instance.doc("users/${user.userID}").get();

    return true;
  }

  @override
  Future<MyUser> readUser(String userID) async {
    DocumentSnapshot _okunanUser =
        await _firebaseDB.collection("users").doc(userID).get();
    Map<String, dynamic> _okunanUserBilgileriMap =
        (_okunanUser.data() as Map<String, dynamic>);

    MyUser _okunanUserNesnesi = MyUser.fromMap(_okunanUserBilgileriMap);
    print("Okunan  User nesnesi: " + _okunanUserNesnesi.toString());
    return _okunanUserNesnesi;
  }

  @override
  Future<bool> updateUserName(String userID, String yeniUserName) async {
    QuerySnapshot user = await _firebaseDB
        .collection("users")
        .where("userName", isEqualTo: yeniUserName)
        .get();
    //aynı isimde kullanıcı var demektir
    if (user.docs.length >= 1) {
      return false;
    } else {
      await _firebaseDB
          .collection("users")
          .doc(userID)
          .update({"userName": yeniUserName});
      return true;
    }
  }
}
